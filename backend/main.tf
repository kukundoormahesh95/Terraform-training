resource "aws_iam_user" "myuser" {
  name = "mahesh98769"
  tags = {
    environment="Testing"
  }
}