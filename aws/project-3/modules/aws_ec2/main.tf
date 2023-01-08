resource "aws_instance" "web_ec2" {
  ami                         = "ami-0b5eea76982371e91"
  instance_type               = "t2.micro"
  key_name                    = var.key_pair_id
  vpc_security_group_ids      = [var.security_group_id]
  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = true
  tags                        = var.web_ec2_tags
}

resource "aws_instance" "db_ec2" {
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  key_name               = var.key_pair_id
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.security_group_id]
  tags                   = var.db_ec2_tags
}

