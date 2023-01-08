variable "vpc_id" {
  type = string
}

variable "security_group_tags" {
  type = map(any)
  default = {
    "Name" = "allow_tls"
  }
}