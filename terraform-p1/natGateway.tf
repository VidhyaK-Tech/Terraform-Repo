# NAT Gateway

# Elastic IP for NAT
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}


# NAT Gateway - public subnet
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public_subnet_1.id

  tags = {
    Name = "nat_gw"
  }
}