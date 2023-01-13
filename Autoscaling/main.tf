
data aws_availability_zones az {
}
resource aws_instance "myinstance" {
  ami="ami-005835d578c62050d"
  instance_type = "t2.micro"
  tags = {
    Name="GooldenServer"
  }
  availability_zone = "ap-southeast-1a"

}
resource aws_ami_from_instance "my_ami" {
  name               = "Mahesh_Test_AMI"
  source_instance_id = aws_instance.myinstance.id
  tags = {
    "Name"="MYAMI"
  }


}
resource aws_launch_template "mytemplate" {
  image_id = aws_ami_from_instance.my_ami.id
  instance_type = aws_instance.myinstance.instance_type
  name_prefix = "amitmp"

}
resource aws_autoscaling_group "Auto" {
  max_size = 5
  min_size = 1
  launch_template {
    version = "$Latest"
   id = aws_launch_template.mytemplate.id

  }

  availability_zones = data.aws_availability_zones.az.names

}