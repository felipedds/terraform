// Terraform Block
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
  region  = var.aws_region
}

// Resource Block
resource "aws_instance" "ec2terraform" {
  ami                    = data.aws_ami.ami_linux2.id
  instance_type          = var.aws_instance_type["dev"]
  user_data              = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_tcp_https.id]
  count                  = 2
  tags = {
    Name = "ec2terraform-${count.index}"
  }
}



