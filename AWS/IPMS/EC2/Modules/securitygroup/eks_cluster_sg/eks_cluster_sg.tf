# # creating security group

resource "aws_security_group" "eks-cluster-sg-Ifx-stag-eks-cluster" {
  name        = "eks-cluster-sg-Ifx-stag-eks-cluster"
  description = "EKS created security group applied to ENI that is attached to EKS Control Plane master nodes, as well as any managed workloads."
  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    type             = "Custom TCP"
    from_port        = 9001
    to_port          = 9001
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]  #Infineon-dev-DB-private3-eu-central-1a
  }
  ingress {
    description      = "TLS from VPC" #elbv2.k8s.aws/targetGroupBinding=shared
    type             = "Custom TCP"
    from_port        = 9001
    to_port          = 9001
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Infineon-dev-subnet-private1APP-eu-central-1a
  }
  ingress {
    description      = "TLS from VPC"
    type             = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Infineon-dev-subnet-private2App-eu-central-1b
  }

ingress {
    description      = "TLS from VPC"  # elbv2.k8s.aws/targetGroupBinding=shared
    type             = "Custom TCP"
    from_port        = 9001
    to_port          = 9010
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # k8s-traffic-infineondevelopekscluster-ce0f3746b9(alb sg)
  }

  ingress {
    description      = "TLS from VPC"
    type             = "Custom TCP"
    from_port        = 30082
    to_port          = 30082
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #infineon-win-Jumpserver
  }

  ingress {
    description      = "TLS from VPC"
    type             = "All TCP"
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # kubectl 
  }
  ingress {
    description      = "TLS from VPC"
    type             = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #infineon-win-Jumpserver
  }

 ingress {
    description      = "TLS from VPC"
    type             = "all traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"] # kubectl
  }

   ingress {
    description      = "TLS from VPC"
    type             = "all traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"] #eks-cluster-sg-infineon-develop-eks-cluster-455808133(selfinbound)
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