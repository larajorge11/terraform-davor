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

  dynamic "egress" {
      for_each = var.EGRESS_RULES_INSTANCE
      content {
          from_port   = egress.value.from_port
          to_port     = egress.value.to_port
          protocol    = egress.value.protocol
          cidr_blocks = egress.value.cidr_blocks
      }
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "allow-mariadb" {
  name = var.SG_NAME_MARIADB
  vpc_id = aws_vpc.davorvpc.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ssh_connection.id] 
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  tags = {
      Name = "allow-mariadb"
  }
}