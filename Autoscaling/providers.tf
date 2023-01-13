provider "aws" {
  region = "ap-southeast-1"
}
terraform {
  backend "s3" {
    bucket = "autoscale-1995"
    key = "terraform.tfstate"
    region="ap-southeast-1"
    dynamodb_table = "Mylocktable"
  }
}