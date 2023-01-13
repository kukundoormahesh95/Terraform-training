output "vpcid" {
  value = aws_vpc.myvpc.id
}
output "defaultroute" {
  value =aws_vpc.myvpc.default_route_table_id
}