terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.15"
}


# aws key pair to connect to our server via ssh
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key_${timestamp()}"
  public_key = file("${path.module}/key.pub")
}


# aws security group to allow ssh connection
resource "aws_security_group" "allow_ssh_sg" {
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    },
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 8080
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 8080
    }
  ]
}


# jenkins aws ec2 instance
resource "aws_instance" "jenkins_server" {
  ami                    = data.aws_ami.ubuntu_ami.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh_sg.id]



  root_block_device {
    volume_size = var.volume_size
  }

  user_data = base64encode(templatefile("${path.module}/jenkins-provision.sh", {
    aws_access_key = var.aws_access_key
    aws_secret_key = var.aws_secret_key
    region         = var.region
    instance_type  = var.instance_type
  }))

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    agent       = true
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/key")
  }

  tags = {
    Name = "${var.name}"
  }
}
