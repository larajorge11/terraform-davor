resource "aws_security_group" "ssh_connection" {
  name        =  var.SG_NAME
  vpc_id      =  aws_vpc.davorvpc.id
  dynamic "ingress" {
      for_each = var.INGRESS_RULES_INSTANCE
      content {
            from_port   = ingress.value.from_port
            to_port     = ingress.value.to_port
            protocol    = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_blocks
      }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}