output "ec2_instance_info" {
  value = {
    large_instance_external_ip   = aws_instance.large_instance.public_ip
    large_instance_internal_ip   = aws_instance.large_instance.private_ip
    large_instance_hostname      = aws_instance.large_instance.private_dns

    medium_instance_1_external_ip   = aws_instance.medium_instance[0].public_ip
    medium_instance_1_internal_ip   = aws_instance.medium_instance[0].private_ip
    medium_instance_1_hostname      = aws_instance.medium_instance[0].private_dns

    medium_instance_2_external_ip   = aws_instance.medium_instance[1].public_ip
    medium_instance_2_internal_ip   = aws_instance.medium_instance[1].private_ip
    medium_instance_2_hostname      = aws_instance.medium_instance[1].private_dns
  }
}
