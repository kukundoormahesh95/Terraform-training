resource "aws_instance" "myvm" {
  availability_zone = "ap-southeast-1a"
  ami = "ami-005835d578c62050d"
   instance_type= var.type
  tags = {
    Name="mahesh-vm-212"
  }

}
resource aws_ebs_volume  "data"{

  availability_zone = "ap-southeast-1a"
  size = 10
  tags = {
    Name="DataVolume"
  }


}
resource aws_volume_attachment "myvolume"{
  instance_id = aws_instance.myvm.id
  volume_id   = aws_ebs_volume.data.id
  device_name = "/dev/sdc"
}
output "outcome" {
  value = aws_instance.myvm.id
}