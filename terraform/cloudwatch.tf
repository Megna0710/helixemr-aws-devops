resource "aws_cloudwatch_log_group" "helixemr" {
  name              = "/ecs/helixemr"
  retention_in_days = 7
}