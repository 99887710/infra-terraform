/*
This is the 'main' Terraform file. It calls all of our modules in order to
bring up the whole infrastructure
*/
#Stores the state as a given key in a given bucket on Amazon S3, enabled locking using dynamoDB

terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-voodoo"
    key = "global/s3/terraform.tfstate"
    region = "eu-west-1"
    # dynamodb_table = "terraform-lock"
  }
}

module "test" {
  source = "./environments/test"
  providers = {
    aws = aws.test
  }
}

//module "dev" {
//  source = "./environments/dev"
//  providers = {
//    aws = aws.dev
//  }
//}
//
//module "sandbox" {
//  source = "./environments/sandbox"
//}
//
//module "prod" {
//  source = "./environments/prod"
//}
