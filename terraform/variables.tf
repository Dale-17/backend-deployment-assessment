variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "my_ip" {
  description = "Your public IPv4 address with /32 (e.g. 41.x.x.x/32)"
  type        = string
}

variable "key_name" {
  description = "Name of the existing EC2 key pair"
  type        = string
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI ID for the chosen region"
  type        = string
}

variable "project_name" {
  description = "Project name used for tagging"
  type        = string
  default     = "startuptech"
}