# Provider and Terraform version requirements for the project.

terraform {
  required_version = ">= 1.7.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# Provider configuration for AWS, specifying the region.

provider "aws" {
  region = "us-east-1"
}
