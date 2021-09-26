module "s3-portfolio-dev" {
  source      = "./modules/web-hosting/s3"
  bucket_name = "dev.sakshampuri.com"
  env         = var.env-dev
  oai_arn     = module.cloudfront-portfolio-dev.oai_arn
}

module "cloudfront-portfolio-dev" {
  source          = "./modules/web-hosting/cloudfront"
  env             = var.env-dev
  bucket_domain   = module.s3-portfolio-dev.bucket_regional_domain
  aliases         = [var.domain-portfolio-dev]
  certificate_arn = module.dns-subdomains-sakshampuri.certificate_arn
  origin_id       = var.domain-portfolio-dev
}

resource "aws_route53_record" "cf_to_s3-portfolio-dev" {
  zone_id = module.dns-subdomains-sakshampuri.zone_id
  name    = var.domain-portfolio-dev
  type    = "A"

  alias {
    name                   = module.cloudfront-portfolio-dev.domain_name
    zone_id                = module.cloudfront-portfolio-dev.zone_id
    evaluate_target_health = false
  }
}
