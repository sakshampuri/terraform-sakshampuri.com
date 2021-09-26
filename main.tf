terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"

  backend "s3" {
    bucket         = "terraform-sakshampuri"
    key            = "sakshampuri.com/state/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-sakshampuri.com-state-lock"
  }

}

provider "aws" {
  region = "ap-south-1"
}

