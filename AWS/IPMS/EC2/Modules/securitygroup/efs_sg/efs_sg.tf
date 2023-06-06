resource "aws_security_group" "efs" {
   #name = "efs-sg"
   description= "Allos inbound efs traffic from ec2"
   vpc_id = var.vpc_id
/*
   ingress {
     security_groups = [aws_security_group.ec2.id]
     from_port = 2049
     to_port = 2049 
     protocol = "tcp"
   }     
        
   egress {
     security_groups = [aws_security_group.ec2.id]
     from_port = 0
     to_port = 0
     protocol = "-1"
   }
   */
   tags = {
    Name = "efs_sg"
  }
 }

 resource "aws_security_group_rule" "efs_sg_in" {
  type                          = "ingress"
  from_port                     = 2049
  to_port                       = 2049
  protocol                      = "tcp"
  source_security_group_id      = var.security_group_id 
  security_group_id             = aws_security_group.efs.id   //ec2-sg
     

#  source_security_group_id      = data.aws_security_group.self_Security_group.id
#  security_group_id             = data.aws_security_group.self_Security_group.id
}


 resource "aws_security_group_rule" "efs_sg_out" {
  type                          = "egress"
  from_port                     = 0
  to_port                       = 0
  protocol                      = "-1"
  source_security_group_id      =  var.security_group_id 
  security_group_id             = aws_security_group.efs.id  //ec2 -sg

#  source_security_group_id      = data.aws_security_group.self_Security_group.id
#  security_group_id             = data.aws_security_group.self_Security_group.id
}