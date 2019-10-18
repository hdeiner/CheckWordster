resource "aws_key_pair" "nancy_key_pair" {
  key_name   = "nancy_key_pair"
  public_key = file("~/.ssh/id_rsa.pub")
}

