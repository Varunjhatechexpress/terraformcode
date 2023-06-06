# creating ssh-key.
resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")

  tags = {
    Name = "kubectl"
  }
}