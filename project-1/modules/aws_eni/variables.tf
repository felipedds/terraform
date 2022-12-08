variable "subnet_id" {
  type = string
}

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
