resource "aws_route_table" "mtc_route_table" {
  vpc_id = var.vpc_id
  tags   = var.route_table_tags
}

resource "aws_route" "mtc_route" {
  route_table_id         = aws_route_table.mtc_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.internet_gateway_id
}

resource "aws_route_table_association" "mtc_route_table_association" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.mtc_route_table.id
}


