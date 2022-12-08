variable "vpc_cidr_block" {
  type    = string
  default = "10.123.0.0/16"
}

variable "vpc_tags" {
  type = map(any)
  default = {
    Name = "mtc_vpc"
  }
}