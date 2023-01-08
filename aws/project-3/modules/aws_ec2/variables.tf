variable "key_pair_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "web_ec2_tags" {
  type        = any
  description = "web EC2 tags"
  default = {
    Name  = "web_ec2"
  }
}

variable "db_ec2_tags" {
  type        = any
  description = "db EC2 tags"
  default = {
    Name  = "db_ec2"
  }
}

