resource "aws_internet_gateway" "helixemr" {
  vpc_id = aws_vpc.helixemr.id

  tags = {
    Name = "helixemr-igw"
  }
}
