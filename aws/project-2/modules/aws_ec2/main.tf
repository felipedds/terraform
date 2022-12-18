resource "aws_instance" "mtc_ec2" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.instance_ami.id
  key_name               = var.key_pair_id
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.subnet_id
  user_data              = file("/home/felipe/Desktop/terraform/aws/examples/project-2/userdata.tpl")

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name : "mtc_ec2"
  }
}
