variable "AWS_REGION" {
    type = string
    default = "eu-west-1"
}

variable "PROFILE" {
  default = "davor"
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

variable "ENV_NAME" {
    default = "demolambdajava"
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