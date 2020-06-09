# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"
provider "aws" {
  region = "us-west-2"
  AWS_ACCESS_KEY_ID = "<access-key-from-aws-user>"
  AWS_SECRET_ACCESS_KEY  = "<secret-key-from-aws-user>"
	
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "ami-0dad20bd1b9c8c004"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}