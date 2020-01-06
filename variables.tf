variable "aws_profile_dev" {
  description = "aws profile"
  type = string
  default = "voodoo_dev"
}

variable "aws_profile_prod" {
  description = "aws profile"
  type = string
  default = "voodoo_prod"
}

variable "aws_region_dev" {
  description = "aws region"
  type = string
  default = "eu-west-1"
}

variable "aws_region_sandbox" {
  description = "aws region"
  type = string
  default = "eu-west-2"
}

variable "aws_region_test" {
  description = "aws region"
  type = string
  default = "eu-west-3"
}

variable "aws_region_prod" {
  description = "aws region"
  type = string
  default = "eu-west-2"
}
