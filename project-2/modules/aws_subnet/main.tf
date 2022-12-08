resource "aws_subnet" "mtc_public_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = var.subnet_availability_zone
  tags                    = var.subnet_tags
}
