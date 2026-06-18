variable "access_key" {
  description = "AWS access key for authentication"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "AWS secret key for authentication"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "AWS region for resource deployment"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-7f418316"
}

variable "ami_id2_iac_var" {
  description = "Alternative AMI ID (currently unused)"
  type        = string
  default     = "ami-7f418316"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "additional_tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "env" {
  description = "Environment name (e.g., test, staging, prod)"
  type        = string
  default     = "test"
}

variable "cost_center" {
  description = "Cost center code for billing and chargeback"
  type        = string
  default     = "ITOMQE"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  type        = string
  default     = "10.0.32.0/24"
}

default_tags {
  tags = {
    owner   = var.owner_name        # Reference from var.tf
                                   # Can be overridden per environment
  }
}
