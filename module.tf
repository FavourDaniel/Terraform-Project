# Variables
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "key_name" {}
variable "private_key_path" {}
variable "region" {
  default = "us-east-1"
}


# Configuring the AWS Provider
provider "aws" {
  region  = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


# RESOURCES
# Ami

resource "aws_instance" "aws_ubuntu" {
  instance_type          = "t2.micro"
  ami                    = "ami-052efd3df9dad4825"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh_http_80.id]
  user_data              = file("userdata.tpl")
}  


# Default VPC
resource "aws_default_vpc" "default" {
  
}


resource "aws_security_group" "allow_ssh_http_80" {
  name        = "allow_ssh_http"
  description = "allow ssh on 22 & http on port 80"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}


# DATA
data "aws_ami" "aws_ubuntu" {
  most_recent = true
  owners      = ["amazon"]

 filter {
    name   = "name"
    values = ["amzn-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


# OUTPUT
output "aws_instance_public_dns" {
  value = aws_instance.aws_ubuntu.public_dns
}

