output "myval" {
  value = var.myvar1
}
output "list" {
  value = var.list[0]
}
output "set" {
  value = var.set
}
output "com"{
  value = tolist(var.set)[0]
}