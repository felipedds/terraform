resource "aws_network_interface" "my_eni" {
  subnet_id   = var.subnet_id
  private_ips = var.eni_private_ips

  tags = var.eni_tags
}
  