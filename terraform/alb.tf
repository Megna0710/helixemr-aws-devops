resource "aws_lb" "helixemr" {
  name               = "helixemr-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb.id
  ]

  subnets = [
    aws_subnet.public_1a.id,
    aws_subnet.public_1b.id
  ]

  ip_address_type = "ipv4"
}

resource "aws_lb_target_group" "helixemr" {
  name        = "helixemr-tg"
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"

  vpc_id = aws_vpc.helixemr.id

  health_check {
    enabled             = true
    protocol            = "HTTP"
    port                = "traffic-port"
    path                = "/helixemr/health/alive"
    interval            = 30
    timeout             = 10
    healthy_threshold   = 2
    unhealthy_threshold = 3
    matcher             = "200"
  }
}

resource "aws_lb_listener" "helixemr_http" {
  load_balancer_arn = aws_lb.helixemr.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.helixemr.arn

    forward {
      target_group {
        arn    = aws_lb_target_group.helixemr.arn
        weight = 1
      }
    }
  }
}