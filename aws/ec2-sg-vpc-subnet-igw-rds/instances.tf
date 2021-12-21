# Create 3 instances of Ubuntu Server and install Apache2 and Telnet
resource "aws_instance" "instances" {
  count                  = 3
  ami                    = "ami-0ed9277fb7eb570c9"
  instance_type          = "t2.micro"
  subnet_id              = element(aws_subnet.public_subnet.*.id, count.index)
  key_name               = "terraform"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id,
                            aws_security_group.allow_outbound.id,
                            aws_security_group.database.id]
  user_data = <<-EOF
                !/bin/bash
                sudo apt update -y
                sudo apt install apache2 telnet -y
                sudo systemctl start apache2
                EOF
  tags = {
    Name = "iti_instances"
  }
}

output "public_ips" {
  value = join(", ", aws_instance.instances.*.public_ip)
}