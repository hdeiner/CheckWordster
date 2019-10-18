output "nancy_dns" {
  value = [aws_instance.ec2_nancy.*.public_dns]
}

output "nancy_ip" {
  value = [aws_instance.ec2_nancy.*.public_ip]
}

