provider "aws" {
  region = "ap-southeast-1"
}
terraform {
  backend "s3" {
    region = "ap-southeast-1"
    key = "terraform.tfstate"
    bucket = "bitbukcet-terraform"
  }
}
resource "aws_instance" "play-vm" {
  ami = var.amiid
  instance_type = var.inssize

  tags = {
    Name = "myci-cd-vm"
  }
}
