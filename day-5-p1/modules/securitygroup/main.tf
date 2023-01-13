resource "aws_security_group" "mysg" {
  name = var.SGName
  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
}