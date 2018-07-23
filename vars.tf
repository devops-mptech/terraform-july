variable "vpc_cidr" {
  default = "156.172.0.0/16"
}
# variable "subnet_cidr1" {
#   default = "156.172.1.0/24"
# }
#
# variable "subnet_cidr2" {
#   default = "156.172.2.0/24"
# }
# variable "subnet_cidr3" {
#   default = "156.172.3.0/24"
# }
variable "subnet_cidr" {
  type = "list"
   default = ["156.172.1.0/24","156.172.2.0/24","156.172.3.0/24","156.172.4.0/24","156.172.5.0/24"]
 }
 # variable "azs" {
 #   type = "list"
 #    default = ["us-west-2a","us-west-2b","us-west-2c"]
 #  }
 data "aws_availability_zones" "available" {}
