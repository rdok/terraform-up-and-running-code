terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "eu-west-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

resource "aws_instance" "web-server" {
  ami                    = "ami-08d658f84a6d84a80"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web-server.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Cyberpunk 2077" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

  tags = {
    Name = "cyberpunk"
  }
}

resource "aws_security_group" "web-server" {

  name = var.security_group_name

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

