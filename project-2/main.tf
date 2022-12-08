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
