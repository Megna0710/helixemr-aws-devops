resource "aws_ecs_service" "helixemr" {
  name            = "helixemr-service"
  cluster         = aws_ecs_cluster.helixemr.id
  task_definition = "helixemr:4"

  desired_count = 1
  launch_type   = "FARGATE"

  platform_version = "LATEST"

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  scheduling_strategy = "REPLICA"

  deployment_controller {
    type = "ECS"
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.helixemr.arn
    container_name   = "helixemr"
    container_port   = 8080
  }

  network_configuration {
    subnets = [
      aws_subnet.ecs_private_1a.id,
      aws_subnet.ecs_private_1b.id
    ]

    security_groups = [
      aws_security_group.ecs.id
    ]

    assign_public_ip = false
  }

  availability_zone_rebalancing = "ENABLED"

  enable_ecs_managed_tags = false
  propagate_tags          = "NONE"
  enable_execute_command  = false

  health_check_grace_period_seconds = 0
}