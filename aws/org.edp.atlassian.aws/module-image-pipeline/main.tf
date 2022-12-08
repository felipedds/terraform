# Provides an EC2 key pair resource. 
resource "aws_key_pair" "ssh_keypar" {
  key_name   = "${var.name}-ssh-key"
  public_key = file("./ssh-keys/id_rsa.pub")
}

# Provides an IAM instance profile.
resource "aws_iam_instance_profile" "iam_profile" {
  name = "${var.name}-iam-profile"
}

# Manages an Image Builder Component.
resource "aws_imagebuilder_component" "ibuilder" {
  name     = "${var.name}-component"
  platform = var.platform
  uri      = var.s3_bucket
  version  = var.component_version
}

# Manages an Image Builder Image Recipe.
resource "aws_imagebuilder_image_recipe" "irecipe" {
  block_device_mapping {
    device_name = var.primary_device_mapping.device_name

    ebs {
      delete_on_termination = var.primary_device_mapping.delete_on_termination
      volume_size           = var.primary_device_mapping.volume_size
      volume_type           = var.primary_device_mapping.volume_type
    }
  }

  component {
    component_arn = aws_imagebuilder_component.ibuilder.arn
  }

  name         = "${var.name}-recipe"
  parent_image = var.parent_image_arn
  version      = var.component_version
}

# Manages an Image Builder Infrastructure Configuration.
resource "aws_imagebuilder_infrastructure_configuration" "infra_image" {
  description                   = "Generated infrastructure configuration for ${var.name} app"
  instance_profile_name         = aws_iam_instance_profile.iam_profile.name
  instance_types                = ["t3.micro"]
  key_pair                      = aws_key_pair.ssh_keypar.key_name
  name                          = "${var.name}-infra-config"
  terminate_instance_on_failure = true
  subnet_id                     = var.subnet_id
  security_group_ids            = [var.security_group_id]

  logging {
    s3_logs {
      s3_bucket_name = var.bucket_logs
      s3_key_prefix  = "pipeline-logs"
    }
  }

  tags = {
    Name = "${var.name}-infra-config"
  }
}

# Manages an Image Builder Image Pipeline.
resource "aws_imagebuilder_image_pipeline" "pipeline" {
  image_recipe_arn                 = aws_imagebuilder_image_recipe.irecipe.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.infra_image.arn
  name                             = "${var.name}-pipeline-image-builder"

  tags = {
    Name = "${var.name}-pipeline-image-builder"
  }
}
