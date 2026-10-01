resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "helixemr" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_1a.id

  tags = {
    Name = "helixemr-nat-gateway"
  }
}
