resource "aws_nat_gateway" "main_natgateway" {
  allocation_id = var.eip_id
  subnet_id     = var.public_subnet_id
  tags          = var.natgateway_tags
  depends_on    = [var.internet_gateway_id]
}
