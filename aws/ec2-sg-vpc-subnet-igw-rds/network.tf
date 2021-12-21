# Create VPC
resource "aws_vpc" "main" {
    cidr_block = "192.168.0.0/16"
    tags = {
      Name = "iti"
    }
}

# Create Private Subnet
resource "aws_subnet" "private_subnet" {
    count             = 3
    vpc_id            = aws_vpc.main.id
    cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index + 10)
    availability_zone = var.availability_zones[count.index]
    tags = {
      Name = "iti_private_subnet_${count.index}"
    }
}

# Create Public Subnet
resource "aws_subnet" "public_subnet" {
    count                   = 3
    vpc_id                  = aws_vpc.main.id
    cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index + 20)
    availability_zone       = var.availability_zones[count.index]
    map_public_ip_on_launch = true
    tags = {
      Name = "iti_public_subnet_${count.index}"
    }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
      Name = "iti_igw"
    }
}

# Create Route Table
resource "aws_route_table" "route_igw" {
    vpc_id = aws_vpc.main.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
      Name = "iti_route_igw"
    }
}

# Create Route Table Association
resource "aws_route_table_association" "prod_route_table_association" {
  count          = 3
  route_table_id = aws_route_table.route_igw.id
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
}