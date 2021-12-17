# Create a VPC
resource "aws_vpc" "prod_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "prod_vpc"
  }
}

# Create Custom Route Table
resource "aws_route_table" "prod_route_table" {
  vpc_id = aws_vpc.prod_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_igw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.prod_igw.id
  }

  tags = {
    Name = "prod_route_table"
  }
}

# Create a Subnet
resource "aws_subnet" "prod_subnet_vpc" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "prod_subnet_vpc"
  }
}

# Associate Subnet with Route Table
resource "aws_route_table_association" "prod_route_table_association" {
  subnet_id      = aws_subnet.prod_subnet_vpc.id
  route_table_id = aws_route_table.prod_route_table.id
}