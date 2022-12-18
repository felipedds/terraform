# VPC
variable "vpc_cidr_block" {
  type    = string
  default = "172.16.0.0/16"
}

variable "vpc_tags" {
  type = map(any)
  default = {
    Name = "mtc_vpc"
  }
}

# Subnet
variable "subnet_cidr_block" {
  type    = string
  default = "172.16.10.0/24"
}

variable "subnet_tags" {
  type = map(any)
  default = {
    "Name" = "mtc_subnet"
  }
}

# Internet Gateway
variable "internet_gateway_tags" {
  type = map(any)
  default = {
    "Name" = "mtc_internet_gateway"
  }
}

# Route Table
variable "route_table_tags" {
  type = map(any)
  default = {
    "Name" = "mtc_route_table"
  }
}

# Security Group
variable "security_group_tags" {
  type = map(any)
  default = {
    "Name" = "mtc_security_group"
  }
}

# EC2
variable "ec2_tags" {
  type = map(any)
  default = {
    "Name" = "mtc_ec2"
  }
}