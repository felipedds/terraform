# Terraform Command Basics

## Terraform Workflow
 - Write: Author infrastructure as code.
 - Plan: Preview changes before applying.
 - Apply: Provision reproducible infrastructure.

## Pre-Conditions for Terraform manifest for EC2 Instance:
 - Pre-Condition-1: Ensure you have default-vpc in that respective region
 - Pre-Condition-2: Ensure AMI you are provisioning exists in that region if not update AMI ID
 - Pre-Condition-3: Verify your AWS Credentials in $HOME/.aws/credentials

## Verify your AWS credentials
```
$HOME/.aws/credentials
```

## Terraform manifest for EC2 Instance
```
// Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.21"
    }
  }
}

// Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "us-east-1"
}

// Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-04d29b6f966df1537" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
}
```

## Terraform Core Commands
```
# Initialize Terraform
terraform init

# Terraform Validate
terraform validate

# Terraform Plan to Verify what it is going to create / update / destroy
terraform plan

# Terraform Apply to Create EC2 Instance
terraform apply
terraform apply -auto-approve
```

## Destroy and Clean-Up Infrastructure
```
# Destroy plan
terraform plan -destroy

# Destroy EC2 Instance
terraform destroy

# Delete Terraform files 
rm -rf .terraform*
rm -rf terraform.tfstate*
```