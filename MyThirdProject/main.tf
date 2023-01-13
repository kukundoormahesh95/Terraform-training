resource "aws_security_group" mysg {
  name = "Basic"
  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks      = ["0.0.0.0/0"]
  }

}
resource "aws_instance" "myinst" {
  availability_zone = "ap-southeast-1a"
  ami = "ami-005835d578c62050d"
  key_name = "Private-Key"
  instance_type = var.type
    tags = {
    Name="Myinstance"
  }
    provisioner "local-exec" {
    command = "echo ${aws_instance.myinst.public_ip} > pub.txt"
  }
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("Provision-Key.pem")
    host     = self.public_ip
  }
  provisioner "file" {
    source      = "demo.txt"
    destination = "/home/ec2-user/demo.txt"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd", "sudo service httpd start"
    ]
  }



}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.mysg.id
  network_interface_id = aws_instance.myinst.primary_network_interface_id
}

resource "aws_iam_user" "myuser" {
  name = "mahesh95"
}