variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "internet_gateway_id" {
  type = string
}

variable "route_table_tags" {
  type = map(any)
  default = {
    "Name" = "mtc_route_table"
  }
}

