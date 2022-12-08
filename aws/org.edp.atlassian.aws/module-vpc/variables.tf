variable "cidr" {
  description = "CIDR block."
  type        = string
  default     = "10.0.0.0/16"
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

variable "tenancy" {
  description = "Instance tenancy."
  type        = string
  default     = "default"
}

variable "name" {
  description = "VPC's name."
  type        = string
}

variable "stack" {
  description = "Stack's name."
  type        = string
  default     = "dev"
}

variable "enable_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
  type        = bool
  default     = true
}
