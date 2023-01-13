module "mymodule_user" {
  source = "./modules/iamusers"
  usertoadd =var.user_to_add
}
module "mymodule_group" {
  source = "./modules/iamgroup"
  grouptoadd = var.group_to_add
}
module "mymodule_membership" {
  source = "./modules/iammembership"
  usermembership= module.mymodule_user.myuser
 groupmembership = module.mymodule_group.mygroup

}
module "mymodule_sg" {
  source = "./modules/securitygroup"
  SGName = var.SGName
}
module "mymodule_instance" {
  source = "./modules/ec2instance"
  instance_name = var.instancename
  type = var.instancetype
  apm_id = var.ami
  securitygroups = module.mymodule_sg.sgid
}