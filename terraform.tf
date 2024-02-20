provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "ec2-kubernetes" {
  key_name   = "ec2-kubernetes"
  public_key = file("ec2-kubernetes.pub")
}

resource "aws_instance" "medium_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type_medium
  count         = 1

  tags = {
    Name = "Kubernetes-Control-Plane"
  }

    key_name = aws_key_pair.ec2-kubernetes.key_name
}

resource "aws_instance" "large_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type_large
  count         = 2

  tags = {
    Name = "Kubernetes-Worker-Node-${count.index}"
  }

    key_name = aws_key_pair.ec2-kubernetes.key_name
}
