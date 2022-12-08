variable "vpc_id" {
  type = string
}

variable "subnet_cidr_block" {
  type    = string
  default = "172.16.0.0/24"
}

variable "subnet_tags" {
  type = map(any)
  default = {
    "Name" = "my_vpc"
  }
}
