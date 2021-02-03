resource "aws_kms_key" "AWS_ACCESS_KEY" {
  description = var.aws_access_key_id
  is_enabled = true
}