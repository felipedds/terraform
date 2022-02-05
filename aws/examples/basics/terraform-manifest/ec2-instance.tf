// Provider Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.73"
    }
  }
}

// Provider Block
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

// Resource Block
resource "aws_instance" "ec2-terraform" {
  ami           = "ami-0a8b4cd432b1c3063"
  instance_type = "t2.micro"
}