resource "aws_ecs_task_definition" "helixemr" {
  family                   = "helixemr"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  cpu    = "512"
  memory = "1024"

  execution_role_arn = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([
    {
      name      = "helixemr"
      image     = "891376989557.dkr.ecr.ap-south-1.amazonaws.com/helixemr:eba88008b8503e5e04c67cb650aae123cd303fa0"
      essential = true

      cpu = 0

      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
          protocol      = "tcp"
        }
      ]

      environment = [
        {
          name  = "HELIX_DB_HOSTNAME"
          value = "helixemr-db.cjmsio86kpm8.ap-south-1.rds.amazonaws.com"
        },
        {
          name  = "JAVA_OPTS"
          value = "-Xmx768m -Xms512m -server -Djava.security.egd=file:/dev/./urandom -Dfile.encoding=UTF-8"
        },
        {
          name  = "HELIX_DB_URL"
          value = "jdbc:mariadb://helixemr-db.cjmsio86kpm8.ap-south-1.rds.amazonaws.com:3306/helixemr?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"
        },
        {
          name  = "HELIX_DB_NAME"
          value = "helixemr"
        },
        {
          name  = "HELIX_DB_USERNAME"
          value = "helixadmin"
        },
        {
          name  = "HELIX_DB_PORT"
          value = "3306"
        }
      ]

      secrets = [
        {
          name      = "HELIX_DB_PASSWORD"
          valueFrom = "arn:aws:secretsmanager:ap-south-1:891376989557:secret:rds!db-1e4e2194-3e2e-4d43-8fb7-6c3276e85069-bkFnoj:password::"
        },
        {
          name      = "HELIX_ADMIN_USER_PASSWORD"
          valueFrom = "arn:aws:secretsmanager:ap-south-1:891376989557:secret:helixemr/admin-password-ap9BaR"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"

        options = {
          "awslogs-group"         = "/ecs/helixemr"
          "awslogs-region"        = "ap-south-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }

      healthCheck = {
        command = [
          "CMD-SHELL",
          "curl -sf http://localhost:8080/helixemr/health/alive || exit 1"
        ]

        interval    = 30
        timeout     = 10
        retries     = 5
        startPeriod = 120
      }

      mountPoints    = []
      volumesFrom    = []
      systemControls = []
    }
  ])
}