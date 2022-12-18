variable "key_pair_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "ec2_tags" {
  type = map(any)
  default = {
    "Name" = "mtc_ec2"
  }
}
