data "aws_caller_identity" "current" {}

resource "aws_ecr_repository" "ecr_repo" {
  name = "${var.general_namespace}_docker_repo"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    env = var.env_namespace
  }
}
