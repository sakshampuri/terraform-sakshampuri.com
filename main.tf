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
    dynamodb_table = "terraform-lock-sakshampuri"
  }

}

provider "aws" {
  region = "ap-south-1"
}

module "portfolio-dev" {
  source              = "./portfolio/dev"
  zone_id_dev         = module.dns-subdomains-sakshampuri.zone_id
  certificate_arn_dev = module.dns-subdomains-sakshampuri.certificate_arn
}

module "portfolio-prod" {
  source               = "./portfolio/prod"
  zone_id_prod         = module.dns-sakshampuri.zone_id
  certificate_arn_prod = module.dns-sakshampuri.certificate_arn
}

