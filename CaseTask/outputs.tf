output "vpc_id" {
  description = "VPC ID created by Terraform"
  value       = aws_vpc.vpcByTFE.id
}

output "subnet_id" {
  description = "Subnet ID created by Terraform"
  value       = aws_subnet.subnetByTFE.id
}

output "network_interface_id" {
  description = "Network interface ID"
  value       = aws_network_interface.nicByTFE.id
}

output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.ec2Instance.id
}

output "ec2_instance_private_ip" {
  description = "Private IP address of EC2 instance"
  value       = aws_instance.ec2Instance.private_ip
}

output "ec2_instance_public_ip" {
  description = "Public IP address of EC2 instance (if assigned)"
  value       = try(aws_instance.ec2Instance.public_ip, null)
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.vpcByTFE.cidr_block
}

output "subnet_cidr" {
  description = "CIDR block of the subnet"
  value       = aws_subnet.subnetByTFE.cidr_block
}
