module "vpc" {
  source  = "./module-vpc"
  name    = "${var.name}-vpc"
  stack   = var.stack
  cidr    = var.cidr
  servers = var.servers
}

module "bucket" {
  source      = "./module-bucket"
  name        = var.name
  environment = var.environment
}

module "pipeline" {
  source            = "./module-image-pipeline"
  name              = var.name
  s3_bucket         = module.bucket.image_pipeline_bucket.object_uri
  bucket_logs       = module.bucket.image_logs_bucket.bucket
  subnet_id         = module.vpc.subnets[0].subnet_id
  security_group_id = module.vpc.security_group_id
}

output "vpcs" {
  value = module.vpc.subnets
}

output "security_groups" {
  value = module.vpc.security_group_id
}

output "bucket_data" {
  value = module.bucket.image_pipeline_bucket
}
