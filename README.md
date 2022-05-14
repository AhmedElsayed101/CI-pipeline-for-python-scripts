# CI-pipeline-for-python-scripts
A simple repository for creating CI pipeline for python scripts with Jenkins

## Project structure
```sh

├── launch-aws-ec2-jenkins-instance  # Folder to launch AWS ec2 instance for Jenkins (contains a README.md file)
├── questions                        # Python logic to solve the questions
├── Dockerfile                       # Docker file to create a container for python
├── Jenkinsfile                      # Jenkins file to automate CI process
├── .gitignore                       # ...
└── README.md                        # ...
```

# If you don't have any Jenkins servers, you can follow instrcutions inside this [README.md file](launch-aws-ec2-jenkins-instance/README.md) to create a Jenkins server on AWS:




# For Testers:

- To test this pipeline. You should make sure that you have followed the instructions from the DevOps Engineers section below.
- Make sure that you added ssh keys.
- Make sure that you created the github webhook.
- Make sure that Docker plugins are installed.
- All you have to do is to change the input inside question files.
- Commit your changes and push the code to GitHub.


# DevOps Engineers:

## System requirements:
- You should have a running Jenkins server and if you don't you can follow the instructions inside that  [READMe.md file](launch-aws-ec2-jenkins-instance/README.md) or You can follow Jenkins instructions [Jenkins Website](https://www.jenkins.io/doc/book/installing/)
- Make sure you have a public IP address so that webhook can work.
- Open a terminal session (ssh) with your server to execute some commands.

###  Tested on Ubuntu:20.04


## Generate ssh-key pair
- While inside the Jenkins server terminal, execute the following commands.
```sh
# Generate key
ssh-keygen -t rsa -f ./key
```
### Add public key to github
- Copy ssh public key
```sh
# Print the public key
cat key.pub 
```
- Copy the output.
- Add the public key(key.pub) to github ssh keys

### Add private key to Jenkins credentials
- Copy ssh public key
```sh
# Print the private key
cat key
```
- Copy the output.
- Add the private key(key) to Jenkins credentials

## Create GitHub webhook

- Go to your remote Repositry line (https://github.com/<User name>/<Repositry name>)
- Click on Settings
- Click on webhooks
- Click on Add webhook
- Paste your Jenkins server ip with this format
```
http://<Jenkins server IP>:<Jenkins server port>/github-webhook/
# for example
http://54.75.50.180:8080/github-webhook/
```
- Add webhook.
- Make sure it's connected. Check recent deliveries


## Add Docker to Jenkins

### Add docker plugins

- Go to your Jenkins dashboard and click on (Manage Jenkins)
- Click on (Manage Plugins)
- Click on (Available) and search for docker
- Make sure to check Docker, Docker pipeline Plugins
- Install without restart
- Check the box to restart


### Add Docker to tools

- Make sure that you installed Docker plugins (Docker, Docker pipeline)
- Go to your Jenkins dashboard and click on (Manage Jenkins)
- Click on (Global Tool Config)
- Scroll down till you find Docker section.
- Click on (Add docker)
- Click on (Install automatic >> download from docker)
- save




## Create the pipeline

- Go to your Jenkins dashboard and click on (New Item)
- Select (Pipeline) and add a name then press (OK)
- Check (GitHub hook trigger for GITScm polling)
- Select Pipeline script from SCM
- Select (Git) SCm
- Add your ssh remote repositry url
- Go to to your Repositry link
- Click on Clone
- Select ssh and copy the link
- Go back to Jenkins and paste the Link
- Select the ssh Credintial that we have created
- Change branch to (/main) or leave it blank
- Make sure that Script Paht is (Jenkins)
- Click on Save button