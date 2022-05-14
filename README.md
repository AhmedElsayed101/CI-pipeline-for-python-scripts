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


# For Testers:

- To test this pipline. You should make sure that you have followed the instuctions from DevOps Engineers' section bellow.
- Make sure that you added ssh keys
- Make sure that you created the webhook
- Make sure that Docker plugins are installed
- All you have to do is just changing the input inside question files
- Commit your changes and push the code to github.




