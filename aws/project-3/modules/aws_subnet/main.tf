resource "aws_subnet" "public_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_block["public"]
  availability_zone = var.availability_zone["public"]
  tags              = var.subnet_public_tags
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_block["private"]
  availability_zone = var.availability_zone["private"]
  tags              = var.subnet_private_tags
}

