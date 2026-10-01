resource "aws_security_group" "alb" {
  name        = "helixemr-alb-sg"
  description = "Security group for HelixEMR Application Load Balancer"
  vpc_id      = aws_vpc.helixemr.id

  tags = {
    Name = "helixemr-alb-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_http" {
  security_group_id = aws_security_group.alb.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "alb_all_outbound" {
  security_group_id = aws_security_group.alb.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_security_group" "ecs" {
  name        = "helixemr-ecs-sg"
  description = "Security group for HelixEMR ECS Fargate tasks"
  vpc_id      = aws_vpc.helixemr.id

  lifecycle {
    ignore_changes = [
      ingress,
      egress
    ]
  }

  tags = {
    Name = "helixemr-ecs-sg"
  }
}

resource "aws_security_group" "rds" {
  name        = "helixemr-rds-sg"
  description = "Security group for HelixEMR RDS MariaDB"
  vpc_id      = aws_vpc.helixemr.id

  lifecycle {
    ignore_changes = [
      ingress,
      egress
    ]
  }

  tags = {
    Name = "helixemr-rds-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "rds_from_ecs" {
  security_group_id            = aws_security_group.rds.id
  referenced_security_group_id = aws_security_group.ecs.id
  from_port                    = 3306
  to_port                      = 3306
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "rds_all_outbound" {
  security_group_id = aws_security_group.rds.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "ecs_from_alb" {
  security_group_id            = aws_security_group.ecs.id
  referenced_security_group_id = aws_security_group.alb.id
  from_port                    = 8080
  to_port                      = 8080
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "ecs_all_outbound" {
  security_group_id = aws_security_group.ecs.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}