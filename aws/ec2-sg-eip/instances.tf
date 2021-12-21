resource "aws_instance" "instances" {
  ami           = var.ami["amazon-linux"]
  instance_type = var.instance_type["us-east-1"]
  tags = {
    Name = "cross_instances"
  }
}
