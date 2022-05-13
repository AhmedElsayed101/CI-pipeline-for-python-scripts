# System requirements:

### You need to use ubuntu or any linux debian based distribution or (windows wsl)

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

# Get public IP address of GGR
JENKINS_IP="$(terraform output jenkins_ip)"
# To remove double quotes
JENKINS_IP=`sed -e 's/^"//' -e 's/"$//' <<<"$JENKINS_IP"`
```