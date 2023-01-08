resource "aws_internet_gateway" "main_internet_gateway" {
  vpc_id = var.vpc_id
  tags   = var.internet_gateway_tags
}
