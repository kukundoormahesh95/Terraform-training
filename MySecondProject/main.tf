provider "aws" {
  region = "ap-southeast-1"
}


resource "aws_iam_user" "myuser" {
  name = var.user

}
resource aws_iam_group "mygroup"{
  name= var.group
}
resource "aws_iam_group_membership" "member" {
  group = aws_iam_group.mygroup.name
  name  = "Member1"
  users = [aws_iam_user.myuser.name]
}
resource aws_ebs_volume "myvolume"{
  availability_zone = "ap-southeast-1a"
  size = 20
  tags = {
    name="myvolume"
  }
}