variable "AWS_REGION" {
    type = string
    default = "us-east-1"
}

variable "PROFILE" {
  default = "davor"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0d0032af1da6905c7"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0d729a60"
  }
}

variable "PATH_PUBLIC_KEY" {
  default = "davorkey.pub"
}

variable "PATH_PRIVATE_KEY" {
  default = "davorkey"
}