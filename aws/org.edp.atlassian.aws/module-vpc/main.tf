# Provides a VPC resource.
resource "aws_vpc" "main_network" {
  cidr_block       = var.cidr
  instance_tenancy = var.tenancy
  tags = {
    Name  = var.name
    Stack = var.stack
  }
  enable_dns_hostnames = var.enable_hostnames
}

# Provides a security group resource.
resource "aws_security_group" "allow_http" {
  depends_on = [
    aws_vpc.main_network
  ]
  name        = "${var.name}-allow-http"
  description = "Allow connections by 80"
  vpc_id      = aws_vpc.main_network.id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "ALL"
    cidr_blocks = [aws_vpc.main_network.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_http"
  }
}

# Provides a security group resource.
resource "aws_security_group" "allow_https" {
  depends_on = [
    aws_vpc.main_network
  ]
  name        = "${var.name}-allow-https"
  description = "Allow connections by 443"
  vpc_id      = aws_vpc.main_network.id

  ingress {
    description = "HTTPS from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "ALL"
    cidr_blocks = [aws_vpc.main_network.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_https"
  }
}

# Provides a security group resource.
resource "aws_security_group" "allow_ssh" {
  depends_on = [
    aws_vpc.main_network
  ]
  name        = "${var.name}-allow-ssh"
  description = "Allow connections by 22."
  vpc_id      = aws_vpc.main_network.id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "ALL"
    cidr_blocks = [aws_vpc.main_network.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

# Provides a resource to create a VPC Internet Gateway.
resource "aws_internet_gateway" "igateway" {
  vpc_id = aws_vpc.main_network.id
}

resource "aws_subnet" "subnets" {
  count = length(var.servers)
  depends_on = [
    aws_vpc.main_network
  ]
  vpc_id                  = aws_vpc.main_network.id
  cidr_block              = var.servers[count.index].subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name     = "${var.servers[count.index].name}-subnet"
    Stack    = var.stack
    Vpc      = aws_vpc.main_network.id
    Server   = "${var.servers[count.index].name}"
    Replicas = "${var.servers[count.index].replicas}"
  }

}

output "security_group_id" {
  depends_on = [
    aws_security_group.allow_http
  ]
  value = aws_security_group.allow_http.id
}

output "subnets" {
  depends_on = [
    aws_subnet.subnets
  ]
  value = [
    for sn in aws_subnet.subnets :
    {
      subnet_id   = sn.id
      subnet_name = sn.tags.Name
      name        = sn.tags.Server
      replicas    = sn.tags.Replicas
      ip_prefix   = "${substr(split("/", sn.cidr_block)[0], 0, length(split("/", sn.cidr_block)[0]) - 1)}"
    }
  ]
}
