module "vpc" {
  source         = "./modules/aws_vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_tags       = var.vpc_tags
}

module "subnet" {
  source            = "./modules/aws_subnet"
  vpc_id            = module.vpc.vpc_id
  subnet_cidr_block = var.subnet_cidr_block
}

module "internet_gateway" {
  source = "./modules/aws_internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source              = "./modules/aws_route_table"
  subnet_id           = module.subnet.subnet_id
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
}

module "security_group" {
  source              = "./modules/aws_security_group"
  vpc_id              = module.vpc.vpc_id
  security_group_tags = var.security_group_tags
}

module "key_pair" {
  source = "./modules/aws_key_pair"
}

module "ec2" {
  source            = "./modules/aws_ec2"
  key_pair_id       = module.key_pair.key_pair_id
  ec2_tags          = var.ec2_tags
  subnet_id         = module.subnet.subnet_id
  security_group_id = module.security_group.security_group_id
}

