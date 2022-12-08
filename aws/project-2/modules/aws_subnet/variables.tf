variable "vpc_id" {
  type = string
}

variable "subnet_cidr_block" {
  type    = string
  default = "10.123.1.0/24"
}

variable "subnet_availability_zone" {
  type    = string
  default = "eu-west-1a"
}

variable "subnet_tags" {
  type = map(any)
  default = {
    "Name" = "mtc_subnet"
  }
}
