variable "AWS_REGION" {
    type = string
    default = "us-east-1"
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-0885b1f6bd170450c"
    }
}

variable "PROFILE" {
  default = "davor"
}