# Provides a S3 bucket resource.
resource "aws_s3_bucket" "bucket" {
  tags = {
    Name        = "${var.name}"
    Environment = "${var.environment}"
  }
  bucket = "${var.name}-ansible-bucket"
}

# Provides a resource for controlling versioning on an S3 bucket.
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  depends_on = [
    aws_s3_bucket.bucket
  ]
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Provides an S3 bucket ACL resource.
resource "aws_s3_bucket_acl" "permissions" {
  depends_on = [
    aws_s3_bucket.bucket
  ]
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

# Provides an S3 object resource (playbooks).
resource "aws_s3_object" "playbooks" {
  depends_on = [
    aws_s3_bucket_acl.permissions
  ]
  bucket   = aws_s3_bucket.bucket.id
  for_each = fileset(var.playbooks_directory, "**")
  key      = "${var.playbooks_directory}/${each.value}"
  source   = "${var.playbooks_directory}/${each.value}"
}

# Provides an S3 object resource.
resource "aws_s3_object" "image_pipeline" {
  depends_on = [
    aws_s3_bucket_acl.permissions
  ]
  bucket = aws_s3_bucket.bucket.id
  key    = "image_pipeline/${var.name}.yaml"
  content = templatefile("amazon-pipelines/create_httpd_image.yaml.tpl", {
    bucket_name   = "${aws_s3_bucket.bucket.bucket}"
    key           = "${var.playbooks_directory}"
    playbook_file = "/tmp/install_httpd.yaml"
  })
}

output "image_pipeline_bucket" {
  depends_on = [
    aws_s3_object.image_pipeline
  ]
  value = {
    object_uri = "s3://${aws_s3_bucket.bucket.bucket}/image_pipeline/${var.name}.yaml"
    version    = "${aws_s3_object.image_pipeline.version_id}"
  }
}

output "image_logs_bucket" {
  depends_on = [
    aws_s3_object.image_pipeline
  ]
  value = {
    bucket = "${aws_s3_bucket.bucket.bucket}"
  }
}
