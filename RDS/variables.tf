variable "myvar1" {
  type =string
}
variable "list" {
  type =list(string)
  default =["user1","user2"]
}
variable "set" {
        type= set(string)
     default = ["user1","usert"]
}