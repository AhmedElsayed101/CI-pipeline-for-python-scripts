# CI-pipeline-for-python-scripts
A simple repository for creating CI pipeline for python scripts with Jenkins

## Project structure
```sh

├── launch-aws-ec2-jenkins-instance  # Folder to launch AWS ec2 instance for Jenkins (contains a README.md file)
├── questions                        # Python logic to solve the questions
├── Dockerfile                       # Docker file to create a container for python
├── Jenkinsfile                      # Jenkins file to automate CI process
├── readme-files                     # Folder that contains README file with some instructions
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


# For DevOps Engineers:

## System requirements:
- You should have a running Jenkins server and if you don't, you can follow the instructions inside this  [READMe.md file](launch-aws-ec2-jenkins-instance/README.md) or You can follow Jenkins instructions [Jenkins Website](https://www.jenkins.io/doc/book/installing/)
- Make sure you have a public IP address so that webhook can work.
- Open a terminal session (ssh) with your server to execute some commands.

###  Tested on Ubuntu:20.04


## Generate ssh-key pair
- Follow the instructions in this file [Generate ssh-key pair](./readme-files/generate-ssh-key-pair.md)

## Create GitHub webhook
- Follow the instructions in this file [Create GitHub webhook](./readme-files/create-GitHub-webhook.md)

## Add Docker to Jenkins
- Follow the instructions in this file [Add Docker to Jenkins](./readme-files/add-Docker-to-Jenkins.md)

## Create the pipeline
- Follow the instructions in this file [Create the pipeline](./readme-files/create-the-pipeline.md)
