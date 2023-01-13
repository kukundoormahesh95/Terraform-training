provider "aws" {
  region="ap-southeast-1"
  access_key = var.access_key
  secret_key = var.secret_key
}
terraform {
  backend "remote" {
      organization = "Mahesh-Terraform-Learning"
      workspaces {
        name="TerraformLearning"
      }

  }

}