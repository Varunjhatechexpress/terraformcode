resource "aws_lb" "ifx-stage-nlb" {
  name               = "ifx-stage-nlb"
  internal           = true
  load_balancer_type = "network"
  subnets            = [var.subnet_az1_id, var.subnet_az2_id]

  enable_deletion_protection = true

  tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
    #deployment_type = var.deployment_type
  }
}

resource "aws_lb_listener" "ifx-stage-nlb_listener" {
  load_balancer_arn = aws_lb.ifx-stage-nlb.arn
  port              = "80"
  protocol          = "TCP"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  #alpn_policy       = "HTTP2Preferred"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ifx-stage-nlb_target_group.arn
  }
}

resource "aws_lb_target_group" "ifx-stage-nlb_target_group" {
  name        = "ifx-stage-nlb-tg"
  port        = 80
  protocol    = "TCP"
  target_type = "alb"
  vpc_id      = var.vpc_id
  deregistration_delay = 300
  preserve_client_ip = "true"
  load_balancing_cross_zone_enabled  = "true"

  health_check {
    #deregistration_delay = 300
    #preserve_client_ip = "true"
    #load_balancing_cross_zone_enabled  = "true"
    enabled   = true #health cehck setting
  #protocol = ""
  #port     = ""
    healthy_threshold = 3
    unhealthy_threshold = 3
    timeout  = 6
    interval = 300
    path     = "/"
    
  }
  

  tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
    #deployment_type = var.deployment_type
  }

}

/*
resource "aws_vpc_endpoint_service" "vpc_endpoint_intergration" {
  acceptance_required        = false
  base_endpoint_dns_names    = ""       #need here vpc end point dns
  network_load_balancer_arns = [aws_lb.ifx-stage-nlb.arn]
}

*/


