resource "aws_subnet" "public_1a" {
  vpc_id            = aws_vpc.helixemr.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "helixemr-public-1a"
  }
}

resource "aws_subnet" "public_1b" {
  vpc_id            = aws_vpc.helixemr.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "helixemr-public-1b"
  }
}

resource "aws_subnet" "ecs_private_1a" {
  vpc_id            = aws_vpc.helixemr.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "helixemr-ecs-private-1a"
  }
}

resource "aws_subnet" "ecs_private_1b" {
  vpc_id            = aws_vpc.helixemr.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "helixemr-ecs-private-1b"
  }
}

resource "aws_subnet" "db_private_1a" {
  vpc_id            = aws_vpc.helixemr.id
  cidr_block        = "10.0.21.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "helixemr-db-private-1a"
  }
}

resource "aws_subnet" "db_private_1b" {
  vpc_id            = aws_vpc.helixemr.id
  cidr_block        = "10.0.22.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "helixemr-db-private-1b"
  }
}