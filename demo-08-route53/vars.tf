variable "PROFILE" {
    default = "davor"
}

variable "AWS_REGION" {
    default = "us-east-1"
}

variable "AMIS" {
    type = map(string)
    default = {
        us-east-1 = "ami-0d0032af1da6905c7"
    }
}