resource "aws_iam_group_membership" "mymember" {
  group = var.groupmembership
  name  = "mymember"
  users = [var.usermembership]
}