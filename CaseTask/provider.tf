terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Uncomment to use remote state (optional)
  # backend "s3" {
  #   bucket         = "your-terraform-state-bucket"
  #   key            = "tfe/terraform.tfstate"
  #   region         = "us-east-1"
  #   encrypt        = true
  #   dynamodb_table = "terraform-lock"
  # }
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

  default_tags {
    tags = {
      managed_by = "Terraform"
      environment = var.env
      cost_center = var.cost_center
      owner = "DevOps-Team"
  }
}

    }
