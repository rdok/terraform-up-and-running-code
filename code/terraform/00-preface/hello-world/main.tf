terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "eu-west-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

resource "aws_instance" "micro" {
  ami           = "ami-04d5cc9b88f9d1d39"
  instance_type = "t2.micro"
}

