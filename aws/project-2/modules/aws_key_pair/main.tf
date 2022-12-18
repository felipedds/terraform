resource "aws_key_pair" "mtc_key_pair" {
  key_name   = "mtc_key"
  public_key = file("/home/felipe/Desktop/terraform/aws/examples/project-2/mtc_key.pub")
}
