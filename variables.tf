variable "region" {
default = "us-east-1"
}

variable "vpc_cidr" {
default = "10.20.0.0/16"
}

variable "subnet_cidr" {
default = "10.20.1.0/24"
}

variable "az" {
default = "us-east-1a"
}

variable "ec2_ami" {
  default = "ami-042e8287309f5df03"
}

variable "instance_type" {
  default = "t3.small"
}

