terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

module "portfolio_host" {
  source = "./modules/web-hosting"

  bucket_name = "dev.sakshampuri.com"

  domain_name = "dev.sakshampuri.com"

  route_53_zone = "sakshampuri.com"

  cert_record = "*.sakshampuri.com"

  env = "dev"

}