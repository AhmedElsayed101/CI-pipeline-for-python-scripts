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

# If you don't have any Jenkins servers, you can follow instrcutions inside this README.md file to create a server on AWS:

[README.md file to help you create the server](launch-aws-ec2-jenkins-instance/README.md)