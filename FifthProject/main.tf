#data "aws_vpc" "def-vpc" {
 # id = var.vpcid
#}

#resource "aws_security_group" "new-sg" {
  #vpc_id = data.aws_vpc.def-vpc.id
 # tags = {
   # Name = "data-sg"
  #}
#}

data aws_availability_zones "az"{

}
data aws_ami "myami" {
 # owners = ["self"]
  most_recent = true
  filter {

     name   = "name"
     values = ["amzn2-ami-kernel-5.10-hvm-2.0.20221210.1-x86_64*"]
   }
}
resource "aws_instance" "myinst" {

  count=length(data.aws_ami.myami.id)
  #count=length(data.aws_availability_zones.az.names)
  ami = data.aws_ami.myami.id  #availability_zone = data.aws_availability_zones.az.names[count.index]
  availability_zone = "ap-southeast-1a" #var.map1.key1
  instance_type = "t2.micro"
  tags = {
    Name="vm_${count.index +1 }"
  }
}
output "myout" {
  value = data.aws_ami.myami.id
}

output "myout2" {
  value = data.aws_ami.myami.name
}