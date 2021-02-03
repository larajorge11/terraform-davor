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
  default = "zemoga-access"
}

variable "SG_NAME" {
    default = "davorsg"
}

variable "INGRESS_RULES" {
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
        from_port = "80"
        to_port = "80"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}