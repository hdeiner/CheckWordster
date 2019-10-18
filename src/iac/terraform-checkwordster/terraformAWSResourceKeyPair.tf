resource "aws_key_pair" "checkwordster_key_pair" {
  key_name   = "checkwordster_key_pair"
  public_key = file("~/.ssh/id_rsa.pub")
}

