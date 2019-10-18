resource "aws_instance" "ec2_checkwordster" {
  count           = 1
  ami             = "ami-759bc50a"
  instance_type   = "t2.small"
  key_name        = aws_key_pair.checkwordster_key_pair.key_name
  security_groups = [aws_security_group.checkwordster.name]
  tags = {
    Name = "CheckWordster Server ${format("%03d", count.index)}"
  }
}

