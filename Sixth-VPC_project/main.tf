resource "aws_vpc" "myvpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name="mytestvpc"
  }
}
data aws_availability_zones myaz{

}
resource "aws_subnet" "mysubnet" {
  vpc_id = aws_vpc.myvpc.id
  count=length(data.aws_availability_zones.myaz.names)
  availability_zone = data.aws_availability_zones.myaz.names[count.index]
  tags = {
    Name= "mysubnet-${count.index+18}"
  }
  cidr_block = "10.10.${count.index+18}.0/24"
}