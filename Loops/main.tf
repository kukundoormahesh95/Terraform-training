#resource "aws_instance" "myinstance" {
##
#  for_each = var.vmnames
# availability_zone = "ap-southeast-1a"
# instance_type = "t2.micro"
# ami = "ami-005835d578c62050d"
## Name=each.value
##}
#}
#resource "aws_iam_user" "myuser" {

# name = (var.gender == "male")? "Triple-H" : "Rock"
#}
#resource "aws_iam_group" "mygrp" {
 # count = (endswith(var.grpname,"_grp"))?1:0
  #name = lower(replace(var.grpname,"_","-"))
#}
output "vars" {
  value = join("-",var.cidrs,var.subnets)
}
#resource "aws_vpc" vpc {
#  cidr_block = "10.0.0.0/16"
## tags = {
#   Name="Mytest"
# }
#}
##resource "aws_subnet" "subs" {
#vpc_id = aws_vpc.vpc.id
# count=length(var.subnets)
# cidr_block = var.cidrs[count.index]
# tags = {
#   Name=var.subnets[count.index]
# }
#}
