resource "aws_security_group" "ec2" {
 # name        = "allow_efs"
  description = "Allow efs outbound traffic"
  vpc_id      = var.vpc_id
  ingress {
     cidr_blocks = ["0.0.0.0/0"]
     from_port = 22
     to_port = 22
     protocol = "tcp"
   }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "efs_ec2_sg"
  }
}