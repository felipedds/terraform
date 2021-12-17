variable "ami" {
  type = map(string)
  default = {
    amazon-linux = "ami-0ed9277fb7eb570c9"
    suse-linux   = "ami-0fde50fcbcd46f2f7"
    ubuntu       = "ami-04505e74c0741db8d"
  }
}

variable "instance_type" {
  type = map(string)
  default = {
    us-east-1 = "t2.micro"
    us-east-2 = "t2.micro"
  }
}