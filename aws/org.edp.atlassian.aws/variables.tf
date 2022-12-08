variable "name" {
  description = "Name"
  type        = string
}

variable "environment" {
  description = "Environment's name"
  type        = string
  default     = "dev"
}

variable "stack" {
  description = "Stack's name "
  type        = string
  default     = "dev"
}

variable "cidr" {
  description = "CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created."
  type        = string
  default     = "eu-west-1"
}

variable "servers" {
  type = list(object({
    name        = string
    subnet_cidr = string
    replicas    = number
  }))
  default = [
    {
      name        = "teste-server"
      subnet_cidr = "10.0.0.0/16"
      replicas    = 1
    }
  ]
}
