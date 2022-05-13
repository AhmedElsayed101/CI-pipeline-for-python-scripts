variable "aws_access_key" {
  description = "AWS Access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret key"
  type        = string
}

variable "region" {
  default = "eu-west-1"
}

variable "name" {
  default = "jenkins-server"
}


variable "volume_size" {
  default = 8
}

variable "instance_type" {
  default = "t2.small"
}