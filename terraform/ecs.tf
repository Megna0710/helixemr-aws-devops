resource "aws_ecs_cluster" "helixemr" {
  name = "helixemr-cluster"

  tags = {
    Name = "helixemr-cluster"
  }
}

