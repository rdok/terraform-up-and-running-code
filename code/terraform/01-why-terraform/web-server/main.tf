terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "eu-west-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

resource "aws_instance" "app" {
  instance_type     = "t2.micro"
  availability_zone = "eu-west-1a"
  ami               = "ami-04d5cc9b88f9d1d39"

  user_data = <<-EOF
              #!/bin/bash
              sudo service apache2 start
              EOF
}

