resource "aws_internet_gateway" "myig" {
    tags = {
    Name="MY-IG"
  }
}