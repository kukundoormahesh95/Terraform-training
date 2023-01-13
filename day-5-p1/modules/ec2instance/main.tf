resource "aws_instance" "mydemoinst" {

  instance_type = var.type
  ami = var.apm_id
  tags = {
    Name=var.instance_name
  }
  security_groups = [var.securitygroups]
}