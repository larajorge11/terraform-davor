terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket = "terraform-state-19890806"
    key = "terraform/demo4"
    profile = "davor"
  }
}