resource "aws_route_table" "main_route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  } 
  tags = var.route_table_tags
}

resource "aws_route_table_association" "main_route_table_association" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.main_route_table.id
}

resource "aws_default_route_table" "default_route_table" {
  default_route_table_id = var.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
  tags = var.route_table_tags
}




