variable "name" {
  description = "Bucket's name."
  type        = string
}

variable "environment" {
  description = "Environment's name."
  type        = string
  default     = "dev"
}

variable "playbooks_directory" {
  description = "Playbooks directory."
  type        = string
  default     = "ansible-playbooks"
}
