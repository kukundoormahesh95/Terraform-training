data aws_ami "myami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20221210.1-x86_64-gp2"]
  }
}
resource "aws_security_group" "mysg" {
 name = "LB-SG"
  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
}
data aws_availability_zones "myaz"{}
resource "aws_instance" "myinstance" {
  count=length(data.aws_availability_zones.myaz.names)
  availability_zone = data.aws_availability_zones.myaz.names[count.index]
  ami = data.aws_ami.myami.id
  instance_type = "t2.micro"
  tags = {
    Name="myvm-${count.index+1}-dev"
  }
  #security_groups = [aws_security_group.mysg.id]
}
data aws_vpc "myvpc" {
  id = "vpc-035a147ea30004427"

}
data aws_subnet "subs" {
 filter {
   name   = "vpc-id"
   values = [data.aws_vpc.myvpc.id]
 }
}

resource "aws_lb" "my-alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.mysg.id]
  tags = {
    Name = "my-alb"
  }

  subnets = [for subnet in data.aws_subnet.subs : subnet.id]
}
resource "aws_lb_target_group" "my-tg" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
}
resource "aws_lb_target_group_attachment" "mylb" {
  count = length(data.aws_availability_zones.myaz.names)
  target_group_arn = aws_lb_target_group.my-tg.arn
  target_id = aws_instance.myinstance[count.index].id
}
