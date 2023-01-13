resource aws_internet_gateway_attachment "myaatch"{
  vpc_id =var.vpcid
  internet_gateway_id = var.igid
}
resource "aws_default_route_table" "myroute" {
  default_route_table_id =  var.myrtid
}
resource "aws_route_table_association" "myrtassoc" {
  route_table_id = aws_default_route_table.myroute.id
  gateway_id =  var.igid
}