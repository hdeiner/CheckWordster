output "checkwordster_dns" {
  value = [aws_instance.ec2_checkwordster.*.public_dns]
}

output "nancy_ip" {
  value = [aws_instance.ec2_checkwordster.*.public_ip]
}

