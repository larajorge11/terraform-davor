variable "AWS_REGION" {
    type = string
    default = "eu-west-1"
}

variable "PROFILE" {
  default = "davorlara"
}

variable "ENV_NAME" {
    default = "poccsv"
}

variable "POLICY_LAMBDA_ASSUME_NAME" {
    default = "lambda_assume_role_policy.json"
}

variable "POLICY_LAMBDA_NAME" {
    default = "lambda_policy.json"
}

variable "ACCESS_KEY" {
  default = "AKIAYLTM6A22O2Y6OUHJ"
}

variable "SECRET_ACCESS_KEY" {
  default = "QUnjk3R2tfKWOSGVCy3GAogTCtA8KdlL2f/0c00T"
}