resource "aws_vpc" "helixemr" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = false

  tags = {
    Name = "helixemr-vpc"
  }
}