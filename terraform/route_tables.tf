resource "aws_route_table" "public" {
  vpc_id = aws_vpc.helixemr.id

  tags = {
    Name = "helixemr-public-rt"
  }
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.helixemr.id
}

resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_1b" {
  subnet_id      = aws_subnet.public_1b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "ecs_private" {
  vpc_id = aws_vpc.helixemr.id

  tags = {
    Name = "helixemr-ecs-private-rt"
  }
}

resource "aws_route" "ecs_private_nat" {
  route_table_id         = aws_route_table.ecs_private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "nat-007890e5359aa0422"
}

resource "aws_route_table_association" "ecs_private_1a" {
  subnet_id      = aws_subnet.ecs_private_1a.id
  route_table_id = aws_route_table.ecs_private.id
}

resource "aws_route_table_association" "ecs_private_1b" {
  subnet_id      = aws_subnet.ecs_private_1b.id
  route_table_id = aws_route_table.ecs_private.id
}

resource "aws_route_table" "db_private" {
  vpc_id = aws_vpc.helixemr.id

  tags = {
    Name = "helixemr-db-private-rt"
  }
}

resource "aws_route_table_association" "db_private_1a" {
  subnet_id      = aws_subnet.db_private_1a.id
  route_table_id = aws_route_table.db_private.id
}

resource "aws_route_table_association" "db_private_1b" {
  subnet_id      = aws_subnet.db_private_1b.id
  route_table_id = aws_route_table.db_private.id
}