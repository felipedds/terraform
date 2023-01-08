resource "aws_key_pair" "key_pair" {
  key_name   = "mtc_key"
  public_key = file("/home/felipe/Desktop/terraform/aws/examples/project-3/mtc_key.pub")
}
