#EC2 Instance 
resource "aws_instance" "web_server" {
  ami           = "ami-01b40e1bcccae197a"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "web_server"
  }
}