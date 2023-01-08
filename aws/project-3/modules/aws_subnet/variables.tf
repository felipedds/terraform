variable "vpc_id" {
  type = string
}

variable "subnet_cidr_block" {
  type = map(string)
  default = {
    "public"  = "10.0.1.0/24"
    "private" = "10.0.2.0/24"
  }
}

variable "availability_zone" {
  type = map(string)
  default = {
    "public"  = "us-east-1a"
    "private" = "us-east-1b"
  }
}

variable "subnet_public_tags" {
  type        = map(any)
  description = "Subnet public tags"
  default = {
    Name = "subnet_public"
  }
}

variable "subnet_private_tags" {
  type        = map(any)
  description = "Subnet private tags"
  default = {
    Name = "subnet_private"
  }
}



