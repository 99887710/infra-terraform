variable "vpc-cidr" {
  description = "CIDR block of the VPC"
  type = "string"
  default = "192.168.0.0/16"
}

variable "private-subnet-cidr" {
  description = "CIDR of private subnet"
  type = "string"
  default = "192.168.0.0/24"
}