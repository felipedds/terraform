variable "ec2_ami" {
  type    = string
  default = "ami-0b0dcb5067f052a63"
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "eni_id" {
  type = string
}

variable "ec2_tags" {
  type = map(any)
  default = {
    "Name" = "my_ec2"
  }
}