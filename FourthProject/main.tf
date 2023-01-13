resource "aws_vpc" "myvpc" {
  cidr_block = var.vpccidr
  tags = {
    Name = var.vpcname
  }
}
resource "aws_internet_gateway" "mygateway" {
  tags = {
    Name = var.vpc_igname
  }
  vpc_id = aws_vpc.myvpc.id

}
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.sub1_cidr
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "Subnet1"

  }
}
#create Private Subnet
resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.sub2_cidr
  availability_zone = "ap-southeast-1b"
  tags = {
    Name = "subnet2"
  }
}
#create Private Route Table
resource "aws_route_table" "demo-vpc-pvt" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "demovpc-pvt-RT"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.mynat.id
  }
}
#create PVT route table association
resource "aws_route_table_association" "pvt-association" {
  route_table_id = aws_route_table.demo-vpc-pvt.id
  subnet_id = aws_subnet.subnet2.id

}
resource "aws_eip" "eip" {

}
#create Route Table
resource "aws_nat_gateway" "mynat" {
  allocation_id = aws_eip.eip.id
  subnet_id = aws_subnet.subnet1.id
  tags = {
    Name="Mynat"
  }
}


