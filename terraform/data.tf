data "aws_vpc" "helixemr" {
  filter {
    name   = "tag:Name"
    values = ["helixemr-vpc"]
  }
}
