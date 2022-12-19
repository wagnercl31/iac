provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

module "S3" {
  source = "./S3"

}

module "ec2" {
  source = "./ec2"
}

