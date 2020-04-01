variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "alb_webserver_name" {
  description = "The name of the webserver ALB"
  type        = string
  default     = "web-server-asg"
}

variable "instance_security_group_name" {
  description = "The name of the security group for the EC2 Instances"
  type        = string
  default     = "web-server"
}

variable "alb_web-server_sg_name" {
  description = "The name of the security group for the ALB"
  type        = string
  default     = "web-server-sg-alb"
}
