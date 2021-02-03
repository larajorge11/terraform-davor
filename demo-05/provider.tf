provider "aws" {
  region = var.AWS_REGION
  #profile = var.PROFILE
  access_key = "AKIAVTB4QGBYQ2IZ2Q4B"
  secret_key = "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"
  assume_role {
    role_arn = "arn:aws:iam::180258017958:role/power-user"
  }
}