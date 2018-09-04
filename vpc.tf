resource "aws_vpc" "myvpc" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name = "MPTECH"
    Env  = "Dev"
  }
}
#
# resource "aws_subnet" "subnet1" {
#   vpc_id     = "${aws_vpc.myvpc.id}"
#   cidr_block = "${var.subnet_cidr[0]}"
#   availability_zone = "us-west-2a"
#   tags {
#    Name = "MPTECH_SN-1"
#  }
# }
# resource "aws_subnet" "subnet2" {
#   vpc_id     = "${aws_vpc.myvpc.id}"
#   cidr_block = "${var.subnet_cidr[1]}"
#   availability_zone = "us-west-2b"
#   tags {
#    Name = "MPTECH_SN-2"
#  }
# }
# resource "aws_subnet" "subnet3" {
#   vpc_id     = "${aws_vpc.myvpc.id}"
#   cidr_block = "${var.subnet_cidr[2]}"
#   availability_zone = "us-west-2c"
#   tags {
#    Name = "MPTECH_SN-3"
#  }
# }
resource "aws_subnet" "subnet1" {
  #count = 3
  count = "${length(var.subnet_cidr)}"
  #count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id     = "${aws_vpc.myvpc.id}"
  cidr_block = "${element(var.subnet_cidr,count.index)}"
  #availability_zone = "${element(var.azs,count.index)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  tags {
   Name = "MPTECH_SN-${count.index + 1}"
 }
}
