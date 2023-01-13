resource aws_iam_user "myuser" {
  name = "mahesh-nayak"
  tags = {
    environment="development"
  }
  lifecycle {
   create_before_destroy = true
     }

}
resource "aws_iam_group" "mygroup" {
 name = "mytest-group"
 lifecycle {
  prevent_destroy = true
 }
}
resource "aws_iam_user" "myuser1" {
  name = "mahesh-nayak-2"
  depends_on = [aws_iam_user.myuser]
  lifecycle {
    ignore_changes = [tags]
  }
  tags = {
    environment="production"
  }
}