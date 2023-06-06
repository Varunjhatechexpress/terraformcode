resource "aws_instance" "web" {
  ami           = "ami-06e46074ae430fba6" # us-west-2
  instance_type = var.instance_type
  availability_zone = "us-east-1b"
  key_name          = var.key_name
  iam_instance_profile = var.iam_instance_profile
  #subnet_id                   = aws_subnet.public-subnet.id
  #role_arn = var.role_arn
   # root disk
  root_block_device {
    volume_size           = "50"
    volume_type           = "gp2"
    #encrypted             = true
    #kms_key_id            = aws_kms_key.kopi-kms-key.key_id
    #delete_on_termination = true
  } 
  #security_group_id    = var.vpc_security_group_ids

  /*ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = "50"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
*/
  tags = {
    stream = var.stream
  }
}

/*
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = var.vpc_security_group_ids
  network_interface_id = var.network_interface_id
}
*/



