module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"

  count = 2
  name  = "my-ec2-cluster-${count.index}"

  ami                    = "ami-005835d578c62050d"
  instance_type          = "t2.micro"
  tags= {
    Terraform   = "true"
    Environment = "dev"
  }
}