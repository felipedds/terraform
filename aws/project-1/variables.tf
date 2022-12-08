# VPC
variable "vpc_cidr_block" {
  type    = string
  default = "172.16.0.0/16"
}

variable "vpc_tags" {
  type = map(any)
  default = {
    Name = "my_vpc"
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
    "Name" = "my_vpc"
  }
}

# Security Group
variable "security_group_tags" {
  type = map(any)
  default = {
    "Name" = "my_security_group"
  }
}

# ENI
variable "eni_private_ips" {
  type    = list(string)
  default = ["172.16.10.100"]
}

variable "eni_tags" {
  type = map(any)
  default = {
    "Name" = "my_eni"
  }
}

# EC2
variable "ec2_ami" {
  type    = string
  default = "ami-01cae1550c0adea9c"
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ec2_tags" {
  type = map(any)
  default = {
    "Name" = "my_ec2"
  }
}

variable "instance_config" {
  type = map(any)
}