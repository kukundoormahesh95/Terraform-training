data aws_availability_zones myaz {

}
resource "aws_subnet" "mysubnets" {
  vpc_id = var.vpcid

  count = length(data.aws_availability_zones.myaz.names)
  cidr_block = "10.10.${count.index+1}.0/24"
  tags = {
    Name="mysubnet-${count.index+1}"
  }
}