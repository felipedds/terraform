resource "aws_instance" "my_ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type

  network_interface {
    network_interface_id = var.eni_id
    device_index         = 0
  }

  tags = var.ec2_tags
}
