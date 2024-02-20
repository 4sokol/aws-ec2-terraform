provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "large_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type_large
  count         = 1

  tags = {
    Name = "large-instance"
  }
}

resource "aws_instance" "medium_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type_medium
  count         = 2

  tags = {
    Name = "medium-instance-${count.index}"
  }
}
