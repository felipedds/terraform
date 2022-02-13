# 7 - Create an Ubuntu Server and install Apache2
resource "aws_instance" "prod_ec2_server" {
  ami           = var.ami["amazon-linux"]
  instance_type = var.instance_type["us-east-1"]
  key_name      = "terraform"

  user_data = <<-EOF
                !/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo bash -c 'echo your very first web server > /var/www/html/index.html'
                EOF
  tags = {
    Name = "prod_ec2_server"
  }
}
