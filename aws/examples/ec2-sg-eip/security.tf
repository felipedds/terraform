resource "aws_security_group" "allow_tls" {
  name        = "cross_allow_tls"
  description = "Allow TLS"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.eip_instance.public_ip}/32"]
  }
}
