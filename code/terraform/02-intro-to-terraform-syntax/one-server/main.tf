terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "eu-west-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

resource "aws_instance" "micro" {
  ami           = "ami-08d658f84a6d84a80"
  instance_type = "t2.micro"

  tags = {
    Name = "micro"
  }
}

output "public_ip" {
  value       = aws_instance.micro.public_ip
  description = "The public IP of the Instance"
}
