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
              echo "Pioneer 0" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "web-server"
  }
}

resource "aws_security_group" "web-server" {

  name = var.security_group_name

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "web-server"
}

output "public_ip" {
  value       = aws_instance.web-server.public_ip
  description = "The public IP of the Instance"
}
