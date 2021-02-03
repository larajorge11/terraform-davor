resource "aws_key_pair" "davorkey" {
  key_name = "davor_key"
  public_key = file(var.PATH_PUBLIC_KEY)
}

resource "aws_instance" "name" {
  ami = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  subnet_id = aws_subnet.main-public-1.id

  vpc_security_group_ids = [aws_security_group.ssh_connection.id]

  key_name = aws_key_pair.davorkey.key_name

  provisioner "file" {
      source = "script.sh"
      destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
      inline = [
          "chmod +x /tmp/script.sh",
          "sudo sed -i -e 's/\r$//' /tmp/script.sh",
          "sudo /tmp/script.sh"
      ]
  }

  connection {
    type = "ssh"
    host = coalesce(self.public_ip, self.private_ip)
    user = var.INSTANCE_USERNAME
    private_key = file(var.PATH_PRIVATE_KEY)
  }
}