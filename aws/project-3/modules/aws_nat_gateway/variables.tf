variable "eip_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "internet_gateway_id" {
  type = string
}

variable "natgateway_tags" {
  type = map(any)
  default = {
    "Name" = "main_natgateway"
  }
}