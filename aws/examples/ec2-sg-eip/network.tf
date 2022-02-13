resource "aws_eip" "eip_instance" {
  vpc = true
}

resource "aws_eip_association" "eip_association" {
  instance_id   = aws_instance.instances.id
  allocation_id = aws_eip.eip_instance.id
}
