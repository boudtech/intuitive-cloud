# VPC
resource "aws_vpc" "lab_vpc" {
  cidr_block       = var.vpc_cidr
  tags = {
    Name = "labVPC"
  }
}

# Subnet : private
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.lab_vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.az
  map_public_ip_on_launch = false
  tags = {
    Name = "Subnet-private"
  }
}

# Security group: SSH allowed from anywhere
resource "aws_security_group" "ec2_sg" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.lab_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
    lifecycle {
    create_before_destroy = true
  }
}

# key-pair imported
resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}

# EC2 Instance
resource "aws_instance" "ec2" {
  ami = var.ec2_ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.private.id
  key_name = aws_key_pair.ec2_key.public_key

  root_block_device {
    delete_on_termination = true
    volume_size = 50
    volume_type = "gp2"
  }
  tags = {
    Name ="EC2"
  }
  count = 2
  depends_on = [ aws_security_group.ec2_sg ]
}

# S3 bucket
resource "aws_s3_bucket" "alexey-budkevich-lab-bucket" {
  bucket = "alexey-budkevich-lab-bucket"

  tags = {
    Name        = "alexey-budkevich-lab-bucket"
  }
}
