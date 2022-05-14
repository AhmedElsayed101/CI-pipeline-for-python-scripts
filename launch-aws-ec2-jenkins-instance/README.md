# Launch AWS EC2 instance for Jenkins

## Folder structure
```sh

├── main.tf                      # Main terrform resources
├── data.tf                      # Predefined AWS AMI 
├── jenkins-provision.sh         # Bash file to install docker, docker-compose and jenkins on the server
├── outputs.tf                   # Define terraform outputs
├── provider.tf                  # Set providers like aws
├── variables.tf                 # Define your variables
├── Makefile                     # Makefile to help automate some terraform commands
└── README.md                    # ...
```

# System requirements:

### You need to use ubuntu or any linux debian based distribution or (windows wsl)
### Tested on Ubuntu:20.04

## Update your system

```sh
sudo apt update
```
## Install all required CLIs and softwares
* AWS CLI

``` sh
# To install unzip
sudo apt install unzip
# To install aws
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip
```

* Terraform CLI

``` sh
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt install terraform
```

## AWS configuration
``` sh
# AWS login, will be used as "Default" profile by Terraform "aws" provider
aws configure

#aws configureAWS Access Key ID [****************4DUN]: xxxxxxxxxxxxx
#AWS Secret Access Key [****************XyKb]: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#Default region name [eu-west-1]: eu-west-1
#Default output format [None]: 
```

## Clone the repository. Go to the project's folder:

## Go to launch-aws-ec2-jenkins-instance directory:
```sh
cd launch-aws-ec2-jenkins-instance
```

## Generate key
```sh
# Generate key
ssh-keygen -t rsa -f ./key
```

## To create the ec2 instance:


### Create `terraform.tfvars` file (Don't forget to modify it with your aws secret and access keys):

```
region        = "eu-west-1"
instance_type = "t3a.small"
volume_size   = 30
aws_access_key = "---"
aws_secret_key = "---"
name           = "jenkins-server"

```


```sh
#Create jenkins plan
make jenkins-plan

# Create infrastructure
make apply-jenkins-plan

# Get public IP address of Jenkins server
JENKINS_IP="$(terraform output jenkins_ip)"
# To remove double quotes
JENKINS_IP=`sed -e 's/^"//' -e 's/"$//' <<<"$JENKINS_IP"`
```


## To connect to the server


```sh
# Connect to the server using the ssh key that we created earlier.
ssh ubuntu@${JENKINS_IP} -i key
```
- Wait for around 2 minutes until provisioning is done

- Test if everything is done? (while you are connected to the server)
```sh
ls -l
```
- If you found docker-compose and Dockerfile files then you would be good to continue.

- You can use this command to verify provisioning("Cloud Init") output  too.
```sh
tail -f /var/log/cloud-init-output.log
```
- Start the Jenkins Docker container
```sh
sudo docker-compose up -d
```
- Jenkins container is running on port 8080
- Wait untile Jenkins is up.
- You Can check using this url (http://<JENKINS_IP>:8080/)
- If you find that jenkins is up
- Run this command inside your server to get the password and copy it with (ctrl+shift+c)

```sh
sudo docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

- Paste the password in the browser
- Install suggested plugins
- Create the admin account
- Now your jenkins server is up and running

## Destroy the jenkins server
```sh
terraform destroy
```