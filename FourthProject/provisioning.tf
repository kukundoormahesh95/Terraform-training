resource "aws_security_group" "mysg" {
  vpc_id = aws_vpc.myvpc.id
  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name="test-sg-instance"
  }

}
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}
resource "aws_eip" "myip" {
  }
resource "aws_instance" "myinst" {
   ami =var.ami
  associate_public_ip_address = true
  user_data = <<EOF
#!/bin/bash
yum update -y
yum install -y httpd
service httpd start
chkconfig httpd on
echo "<body bgcolor="#FFFF00"></body>" > /var/www/html/index.html
EOF


availability_zone = "ap-southeast-1a"
   instance_type = "t2.medium"
  tags = {
    Name="mahesh-instance"

  }

  key_name =  aws_key_pair.deployer.id
  security_groups = [aws_security_group.mysg.id]
  subnet_id =aws_subnet.subnet1.id

}
