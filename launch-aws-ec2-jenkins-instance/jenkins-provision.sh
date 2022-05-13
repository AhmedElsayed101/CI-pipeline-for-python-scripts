#!/bin/bash

# Update OS
sudo apt update

# Install helper packages
sudo apt install -y git build-essential net-tools

# Install Docker
sudo curl https://get.docker.com | sh && sudo systemctl --now enable docker
sudo usermod -aG docker ubuntu
sudo su - ubuntu

# Install docker-comopse
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# Create docker compose file
sudo cat << EOF >> /home/ubuntu/docker-compose.yml
version: '3.1'
services:
    jenkins:
        build:
            context: ./
        restart: unless-stopped
        volumes:
            - /var/run/docker.sock:/var/run/docker.sock
            - /srv/www/jenkins:/var/jenkins_home
        ports:
            - "8080:8080"
            - "50000:50000"
EOF



# Create docker file
sudo cat << EOF >> /home/ubuntu/Dockerfile
FROM jenkins/jenkins:2.332.2-jdk11
USER root
RUN apt-get -y update && \
 apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common && \
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
 add-apt-repository \
 "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
 $(lsb_release -cs) \
 stable" && \
 apt-get update && \
 apt-get -y install docker-ce docker-ce-cli containerd.io
RUN curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
 chmod +x /usr/local/bin/docker-compose && \
 ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
RUN usermod -aG docker jenkins
EOF

echo $PWD

