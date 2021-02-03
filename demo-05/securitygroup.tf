resource "aws_security_group" "ssh_connection" {
  name        = var.SG_NAME

  dynamic "ingress" {
      for_each = var.INGRESS_RULES
      content {
            from_port   = ingress.value.from_port
            to_port     = ingress.value.to_port
            protocol    = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_blocks
      }
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_instance" "davor_instance" {
  ami = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.ssh_connection.name ]

  tags = {
    "Name" = "davorInstance"
  }
}