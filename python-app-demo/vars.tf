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

variable "SG_NAME" {
    default = "davorsg"
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

variable "INGRESS_RULES_INSTANCE" {
    type = list(object({
    from_port = string
    to_port = string
    protocol = string
    cidr_blocks = list(string)
  }))
  default = [
    {
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    },
    {
        from_port = "5000"
        to_port = "5000"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
