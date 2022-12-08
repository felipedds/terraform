variable "vpc_id" {
    type = string
}

variable "security_group_tags" {
  type = map(any)
  default = {
    "Name" = "my_security_group"
  }
}