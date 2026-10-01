resource "aws_iam_role" "ecs_task_execution" {
  name        = "HelixEMR-ECSTaskExecutionRole"
  description = "Execution role for HelixEMR ECS Fargate tasks"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  max_session_duration = 3600
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy" "rds_secret_access" {
  name = "HelixEMR-RDS-SecretAccess"
  role = aws_iam_role.ecs_task_execution.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue"
        ]
        Resource = "arn:aws:secretsmanager:ap-south-1:891376989557:secret:rds!db-1e4e2194-3e2e-4d43-8fb7-6c3276e85069-bkFnoj"
      }
    ]
  })
}

resource "aws_iam_role_policy" "secret_access" {
  name = "HelixEMR-SecretAccess"
  role = aws_iam_role.ecs_task_execution.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue"
        ]
        Resource = [
          "arn:aws:secretsmanager:ap-south-1:891376989557:secret:rds!db-1e4e2194-3e2e-4d43-8fb7-6c3276e85069-bkFnoj",
          "arn:aws:secretsmanager:ap-south-1:891376989557:secret:helixemr/admin-password-ap9BaR"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy" "github_actions_ecs_deployment" {
  name = "HelixEMR-ECS-Deployment"
  role = "GitHubActions-HelixEMR-ECR"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "RegisterHelixEMRTaskDefinition"
        Effect = "Allow"

        Action = [
          "ecs:RegisterTaskDefinition",
          "ecs:DescribeTaskDefinition"
        ]

        Resource = "*"
      },

      {
        Sid      = "DeployHelixEMRService"
        Effect   = "Allow"
        Action   = "ecs:UpdateService"
        Resource = "arn:aws:ecs:ap-south-1:891376989557:service/helixemr-cluster/helixemr-service"
      },

      {
        Sid    = "ReadHelixEMRDeploymentStatus"
        Effect = "Allow"

        Action = [
          "ecs:DescribeServices",
          "ecs:DescribeTasks"
        ]

        Resource = "*"
      },

      {
        Sid      = "PassHelixEMRExecutionRole"
        Effect   = "Allow"
        Action   = "iam:PassRole"
        Resource = "arn:aws:iam::891376989557:role/HelixEMR-ECSTaskExecutionRole"

        Condition = {
          StringEquals = {
            "iam:PassedToService" = "ecs-tasks.amazonaws.com"
          }
        }
      }
    ]
  })
}