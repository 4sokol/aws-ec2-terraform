variable "aws_region" {
  description = "The AWS region where EC2 instances will be launched."
}

variable "ami_id" {
  description = "The ID of the Ubuntu Server 20.04 AMI."
}

variable "instance_type_large" {
  description = "The instance type for large EC2 instances."
}

variable "instance_type_medium" {
  description = "The instance type for medium EC2 instances."
}