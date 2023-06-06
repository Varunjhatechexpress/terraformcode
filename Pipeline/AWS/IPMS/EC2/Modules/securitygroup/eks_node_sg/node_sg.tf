# # creating security group

resource "aws_security_group" "eks-node-sg-Ifx-Stag" {
  name        = "eks-node-sg-Ifx-Stag"
  description = "Security group for all nodes in the nodeGroup to allow SSH access"
  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]  #jump server private ip address 
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 30081
    to_port          = 30081
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]  #jump server private ip address 
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
  } 
}

/*
resource "aws_security_group_rule" "rds_sg" {
  type                          = "ingress"
  from_port                     = 0
  to_port                       = 65535
  protocol                      = "tcp"
  source_security_group_id      = aws_security_group.rds_sg.id
  security_group_id             = aws_security_group.rds_sg.id
#  source_security_group_id      = data.aws_security_group.self_Security_group.id
#  security_group_id             = data.aws_security_group.self_Security_group.id
}
*/