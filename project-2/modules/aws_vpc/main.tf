resource "aws_vpc" "mtc_vpc" {
  cidr_block           = var.vpc_cidr_block
  tags                 = var.vpc_tags
  enable_dns_hostnames = true
  enable_dns_support   = true
}
