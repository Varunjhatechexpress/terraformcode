resource "aws_lb" "application_load_blancer" {
  name               = "app-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = [var.subnet_az1_id, var.subnet_az2_id]

  enable_deletion_protection = true
/*
  access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "test-lb"
    enabled = true
  }
*/
    tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
    #deployment_type = var.deployment_type
  }
}

/*
resource "aws_lb" "front_end" {
  # ...
}

resource "aws_lb_target_group" "front_end" {
  # ...
}
*/

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.application_load_blancer.arn
  port              = "80"
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
   # type             = "forward"
    #target_group_arn = aws_lb_target_group.alb_target_group.arn

    type             = "fixed-response"
    #target_group_arn = aws_lb_target_group.alb_target_group.arn

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "404"
    }
  }
}

#create target group 

resource "aws_lb_target_group" "alb_target_group" {
  name        = "app-alb-tg"
  port        = 443
  protocol    = "HTTPS"
  target_type = "ip"
  vpc_id      = var.vpc_id
  deregistration_delay = 300
  load_balancing_cross_zone_enabled  = "true"

  health_check {
    enabled   = true #health cehck setting
    #deregistration_delay = 300
    #load_balancing_cross_zone_enabled  = "true"
    #protocol = ""
    #port     = ""
    healthy_threshold = 3
    unhealthy_threshold = 3
    timeout  = 8
    interval = 10
    
  }
  

    tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
    #deployment_type = var.deployment_type
  }

}

/*
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}


resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.test.arn
  #target_id        = aws_instance.test.id
  port             = 80
}

resource "aws_lb_target_group" "test" {
  # ... other configuration ...
}

/*
resource "aws_instance" "test" {
  # ... other configuration ...
}
*/