packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "Tomcat-packer-Ubuntu-aws"
  instance_type = "t2.micro"
  region        = "ap-southeast-1"

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-*-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }

    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name    = "learn-packer-ubuntu"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  provisioner "shell"{
    inline = [
      "echo Installing Tomcat",
      "sleep 30",
      "sudo apt-get update",
      "sudo apt-get install -y tomcat9",
      "sudo sudo systemctl start tomcat9",
      "echo \"FOO is $FOO\" > example.txt",
    ]
  }
}
