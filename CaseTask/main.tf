resource "aws_vpc" "vpcByTFE" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "vpc-${var.env}-tfe"
  }
}

resource "aws_subnet" "subnetByTFE" {
  vpc_id            = aws_vpc.vpcByTFE.id
  cidr_block        = var.subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "subnet-${var.env}-tfe"
  }
}

resource "aws_network_interface" "nicByTFE" {
  subnet_id = aws_subnet.subnetByTFE.id

  tags = {
    Name = "eni-${var.env}-tfe"
  }
}

resource "aws_instance" "ec2Instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  
  network_interface {
    network_interface_id = aws_network_interface.nicByTFE.id
    device_index         = 0
  }

  tags = merge(
    var.additional_tags,
    {
      Name        = "ec2-${var.env}-tfe"
      env         = var.env
      cost_center = var.cost_center
    }
  )

  depends_on = [aws_network_interface.nicByTFE]
}

# Data source to fetch available AZs in the region
data "aws_availability_zones" "available" {
  state = "available"
}
