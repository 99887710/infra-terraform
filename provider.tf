# Setup AWS as our Terraform provider
provider "aws" {
  alias = "test"
  profile = var.aws_profile_dev
  region = var.aws_region_test
}

//provider "aws" {
//  alias = "dev"
//  profile = var.aws_profile_dev
//  region = var.aws_region_dev
//  version = "2.40.0"
//}
//
//provider "aws" {
//  alias = "sandbox"
//  profile = var.aws_profile_dev
//  region = var.aws_region_sandbox
//  version = "2.40.0"
//}

//provider "aws" {
//  alias = "prod"
//  profile = "${var.aws_region_prod}"
//  region = "${var.aws_region_prod}"
//}
