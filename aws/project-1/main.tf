module "vpc" {
  source         = "./modules/aws_vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_tags       = var.vpc_tags
}

module "subnet" {
  source            = "./modules/aws_subnet"
  vpc_id            = module.vpc.vpc_id
  subnet_cidr_block = var.subnet_cidr_block
  subnet_tags       = var.subnet_tags
}

module "security_group" {
  source              = "./modules/aws_security_group"
  vpc_id              = module.vpc.vpc_id
  security_group_tags = var.security_group_tags
}

module "eni" {
  source          = "./modules/aws_eni"
  for_each        = var.instance_config
  subnet_id       = module.subnet.subnet_id
  eni_private_ips = each.value.eni_private_ips
  eni_tags        = each.value.eni_tags
}

module "ec2" {
  source            = "./modules/aws_ec2"
  depends_on        = [module.eni]
  for_each          = var.instance_config
  ec2_ami           = each.value.ec2_ami
  ec2_instance_type = each.value.ec2_instance_type
  eni_id            = module.eni[each.key].eni_id
  ec2_tags          = each.value.ec2_tags
}
