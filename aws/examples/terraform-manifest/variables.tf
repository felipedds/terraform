// Input variables

// AWS region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}

// AWS availability zones
variable "aws_availability_zones" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

// AWS EC2 instance type
variable "aws_instance_type" {
  description = "EC2 instance type"
  type        = map(string)
  default = {
    "dev"  = "t2.micro"
    "hom"  = "t2.micro"
    "prod" = "t2.micro" 
  }
}


