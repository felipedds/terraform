# Three-tier VPC

Building an Three-tier Web, App and DB with:
VPC, Internet Gateway, NAT Gateway, Elastic IP, Route Tables, Public Subnets, Private Subnets

## Steps
- Create VPC
- Create Public and Private Subnets
- Create Internet Gateway and Associate to VPC
- Create NAT Gateway in Public Subnet
- Create Public Route Table, Add Public Route via Internet Gateway and Associate Public Subnet
- Create Private Route Table, Add Private Route via NAT Gateway and Associate Private Subnet

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
terraform destroy -auto-approve

# Delete Terraform files 
rm -rf .terraform*
rm -rf terraform.tfstate*
```