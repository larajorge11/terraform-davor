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

variable "SG_NAME_MARIADB" {
    default = "mariadbsg"
}

variable "PATH_PUBLIC_KEY" {
  default = "davorkey.pub"
}

variable "PATH_PRIVATE_KEY" {
  default = "davorkey"
}

variable "RDS_PASSWORD" {
  default = "JORlaresp1989!"
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
    }
  ]
}

variable "INGRESS_RULES_MARIADB" {
    type = list(object({
    from_port = string
    to_port = string
    protocol = string
  }))
  default = [
    {
        from_port = "3306"
        to_port = "3306"
        protocol = "tcp"
    }
  ]
}

variable "EGRESS_RULES_INSTANCE" {
    type = list(object({
        from_port = string
        to_port = string
        protocol = string
        cidr_blocks = list(string)
    }))
    default = [
    {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "EGRESS_RULES_MARIADB" {
    type = list(object({
        from_port = string
        to_port = string
        protocol = string
        cidr_blocks = list(string)
        self = bool
    }))
    default = [
    {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        self = true
    }
  ]
}