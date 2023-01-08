variable "vpc_id" {
  type = string
}

variable "internet_gateway_tags" {
  type = map(any)
  default = {
    "Name" = "main_internet_gateway"
  }
}
