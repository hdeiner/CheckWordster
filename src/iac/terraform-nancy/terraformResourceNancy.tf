resource "aws_instance" "ec2_nancy" {
  count           = 1
  ami             = "ami-759bc50a"
  instance_type   = "t2.small"
  key_name        = aws_key_pair.nancy_key_pair.key_name
  security_groups = [aws_security_group.nancy.name]
  tags = {
    Name = "CheckWordster Nancy Server ${format("%03d", count.index)}"
  }
}

