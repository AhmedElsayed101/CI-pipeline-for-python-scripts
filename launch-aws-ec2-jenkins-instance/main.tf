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



