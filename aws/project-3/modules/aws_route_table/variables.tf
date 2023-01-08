variable "vpc_id" {
  type = string
}

variable "default_route_table_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "internet_gateway_id" {
  type = string
}

variable "route_table_tags" {
  type = map(any)
  default = {
    "Name" = "main_route_table"
  }
}

