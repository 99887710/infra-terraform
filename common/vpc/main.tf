
resource "aws_vpc" "voodoo_vpc" {
  cidr_block = "${var.vpc-cidr}"
  
}

# resource "aws_subnet" "private-subnet" {
#   vpc_id = "${aws_vpc.voodoo_vpc.id}"
#   cidr_block = "${var.private-subnet-cidr}"

#   tags = {
#     name = "private"
#   }
# }

data "aws_subnet" "private-subnet" {
  id = "subnet-018bad3a26ef9ff04"
}

output "private-subnet-id" {
  value = "${data.aws_subnet.private-subnet.id}"
}
