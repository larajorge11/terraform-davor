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

variable "SG_NAME" {
  default = "sgelastic"
}

variable "POLICY_LAMBDA_ASSUME_NAME" {
    default = "lambda_assume_role_policy.json"
}

variable "POLICY_LAMBDA_NAME" {
    default = "lambda_policy.json"
}

variable "AMIS" {
    type = map(string)
    default = {
        eu-west-1 = "ami-0fc970315c2d38f01"
    }
}

variable "PATH_PUBLIC_KEY" {
  default = "davorkey.pub"
}

variable "PATH_PRIVATE_KEY" {
  default = "davorkey"
}

variable "ACCESS_KEY" {
  default = "AKIAYLTM6A22O2Y6OUHJ"
}

variable "SECRET_ACCESS_KEY" {
  default = "QUnjk3R2tfKWOSGVCy3GAogTCtA8KdlL2f/0c00T"
}