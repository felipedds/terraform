// Create a VPC module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"

  // VPC Basic details
  name = "vpc-dev"
  cidr = "10.0.0.0/16"

  // AZ and Subnets
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  // Database subnet
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = ["10.0.151.0/24", "10.0.152.0/24"]

  // NAT Gateway
  enable_nat_gateway = true
  single_nat_gateway = true

  // VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  // Tags  
  public_subnet_tags = {
    Name = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  vpc_tags = {
    Type = "vpc-dev"  
  }

  tags = {
    Owner       = "Felipe"
    Environment = "dev"
  }
}

