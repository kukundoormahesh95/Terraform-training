provider "aws" {
  region="ap-southeast-1"

}
terraform {
backend "s3" {
  key = "terraform.tfstate"
  bucket = "mytest-1995"
  region = "ap-southeast-1"
  dynamodb_table = "Mylocktable"
}
}