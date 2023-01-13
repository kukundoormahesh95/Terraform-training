module "myvpc" {
  source = "./modules/createvpc"

}
module "mysubnets" {
  source = "./modules/createsubnets"
  vpcid = module.myvpc.vpcid
}
module "myigs" {
  source = "./modules/createig"
  vpcid = module.myvpc.vpcid
}
module "myatt" {
  source = "./modules/attachig"
  vpcid = module.myvpc.vpcid
  igid = module.myigs.igid
  myrtid = module.myvpc.defaultroute
}