resource "aws_instance" "davorinstance" {
  ami = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  provisioner "local-exec" {
      command = "echo ${aws_instance.davorinstance.private_ip} >> private_ips.txt"
  }

  tags = {
    "Name" = "davorInstance"
  }
}

output "ip" {
  value = aws_instance.davorinstance.public_ip
}