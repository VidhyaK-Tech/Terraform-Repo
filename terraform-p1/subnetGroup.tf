#RDS Subnet Group
resource "aws_db_subnet_group" "sub_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]

  tags = {
    Name = "My DB subnet group"
  }
}