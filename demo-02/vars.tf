variable "AWS_REGION" {
    default = "us-east-1"
}

variable "PROFILE" {
  default = "davor"
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-0885b1f6bd170450c"
    }
}

variable "PATH_PUBLIC_KEY" {
  default = "davorkey.pub"
}

variable "PATH_PRIVATE_KEY" {
  default = "davorkey"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}