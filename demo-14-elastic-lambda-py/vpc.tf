 # Internet VPC
resource "aws_vpc" "davorvpc" {
  
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  enable_classiclink = false
  
  tags = {
    Name = "davorvpc"
  }
}

# Subnets
resource "aws_subnet" "main-private-1" {
  vpc_id = aws_vpc.davorvpc.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = false
  availability_zone = "eu-west-1a"

  tags = {
    Name = "main-private-1"
  }
}

