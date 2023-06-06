resource "aws_instance" "redhat_efs_instance" {
  count            = length(var.public-subnet-ids)  
  ami              = var.ami       # us-west-2    //ami-0299d82d412b669b3  ..>8.1
  instance_type     = var.instance_type
  availability_zone = var.availability_zone[count.index]
  key_name          = var.key_name
  iam_instance_profile = var.iam_instance_profile
  associate_public_ip_address= true
  subnet_id            = var.public-subnet-ids[count.index]
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
  vpc_security_group_ids    = var.vpc_security_group_ids

  tags = {
    stream = var.stream
    Name   = var.name
  }
}


  /*ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = "50"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
*/

/*
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = var.vpc_security_group_ids
  network_interface_id = var.network_interface_id
}
*/



