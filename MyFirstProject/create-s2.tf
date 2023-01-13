resource "aws_s3_bucket" "mytestbucket" {
  bucket = "mahesh-s3-test"
  tags = {
    environment="development"
  }
}