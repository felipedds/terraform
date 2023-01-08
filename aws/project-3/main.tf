module "vpc" {
  source = "./modules/aws_vpc"
}

module "subnet" {
  source = "./modules/aws_subnet"
  vpc_id = module.vpc.vpc_id
}

module "internet_gateway" {
  source = "./modules/aws_internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source                 = "./modules/aws_route_table"
  vpc_id                 = module.vpc.vpc_id
  public_subnet_id       = module.subnet.public_subnet_id
  internet_gateway_id    = module.internet_gateway.internet_gateway_id
  default_route_table_id = module.vpc.default_route_table_id
}

module "nat_gateway" {
  source              = "./modules/aws_nat_gateway"
  eip_id              = module.eip.eip_id
  public_subnet_id    = module.subnet.public_subnet_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
}

module "eip" {
  source = "./modules/aws_eip"
}

module "security_group" {
  source = "./modules/aws_security_group"
  vpc_id = module.vpc.vpc_id
}

module "key_pair" {
  source = "./modules/aws_key_pair"
}

module "ec2" {
  source            = "./modules/aws_ec2"
  key_pair_id       = module.key_pair.key_pair_id
  public_subnet_id  = module.subnet.public_subnet_id
  private_subnet_id = module.subnet.private_subnet_id
  security_group_id = module.security_group.security_group_id
}
