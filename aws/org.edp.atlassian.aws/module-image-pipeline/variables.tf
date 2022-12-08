variable "name" {
  description = "Pipeline's name."
  type        = string
}

variable "platform" {
  description = "Platform."
  type        = string
  default     = "Linux"
}

variable "s3_bucket" {
  description = "S3 bucket."
  type        = string
}

variable "component_version" {
  description = "Component Version."
  type        = string
  default     = "1.0.0"
}

variable "primary_device_mapping" {
  type = object({
    device_name           = string
    delete_on_termination = bool
    volume_size           = number
    volume_type           = string
  })

  default = {
    delete_on_termination = true
    device_name           = "/dev/xvdb"
    volume_size           = 30
    volume_type           = "gp2"
  }
}

variable "parent_image_arn" {
  description = "Parent image ARN."
  type        = string
  default     = "arn:aws:imagebuilder:eu-west-1:aws:image/amazon-linux-2-x86/x.x.x"
}

variable "bucket_logs" {
  description = "Bucket logs."
  type        = string
}

variable "subnet_id" {
  description = "Subnet id."
  type        = string
}

variable "security_group_id" {
  description = "Security group id."
  type        = string
}

