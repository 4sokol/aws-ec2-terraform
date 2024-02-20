provider "aws" {
  region = var.aws_region
}


# Define SSH keypair
resource "aws_key_pair" "ec2-kubernetes" {
  key_name   = "ec2-kubernetes"
  public_key = file("ec2-kubernetes.pub")
}


# Security Group. This need to be added since AWS Provider v4.29+ to set VPC id
resource "aws_security_group" "instance_sg" {
  name        = "instance-sg"
  description = "Security group for EC2 instances"
  vpc_id      = aws_default_vpc.default.id


# Allow inbound SSH (port 22) traffic from any location
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow from any location
  }

# Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# Define VPC. This need to be added since AWS Provider v4.29+ to get VPC id
resource "aws_default_vpc" "default" {}



# EC2 Control Plane
resource "aws_instance" "medium_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type_medium
  count         = 1

  tags = {
    Name = "Kubernetes-Control-Plane"
  }

    key_name = aws_key_pair.ec2-kubernetes.key_name
    vpc_security_group_ids = [aws_security_group.instance_sg.id]
}

# EC2 Worker nodes
resource "aws_instance" "large_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type_large
  count         = 2

  tags = {
    Name = "Kubernetes-Worker-Node-${count.index}"
  }

    key_name = aws_key_pair.ec2-kubernetes.key_name
    vpc_security_group_ids = [aws_security_group.instance_sg.id]
}
