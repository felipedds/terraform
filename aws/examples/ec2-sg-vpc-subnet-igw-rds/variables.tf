variable "availability_zones" {
    description = "Availability Zones"
    type = list(string)
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}