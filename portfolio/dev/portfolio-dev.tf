module "s3-portfolio-dev" {
  source      = "../../modules/web-hosting/s3"
  bucket_name = "dev.sakshampuri.com"
  env         = var.env-dev
  oai_arn     = module.cloudfront-portfolio-dev.oai_arn
}

module "cloudfront-portfolio-dev" {
  source          = "../../modules/web-hosting/cloudfront"
  env             = var.env-dev
  bucket_domain   = module.s3-portfolio-dev.bucket_regional_domain
  aliases         = [var.domain-portfolio-dev]
  certificate_arn = var.certificate_arn_dev
  origin_id       = var.domain-portfolio-dev
}

resource "aws_route53_record" "cf_to_s3-portfolio-dev" {
  zone_id = var.zone_id_dev
  name    = var.domain-portfolio-dev
  type    = "A"

  alias {
    name                   = module.cloudfront-portfolio-dev.domain_name
    zone_id                = module.cloudfront-portfolio-dev.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_CNAME" {
  zone_id = var.zone_id_dev
  name    = var.www_domain-portfolio-dev
  type    = "CNAME"
  ttl     = "60"
  records = [var.domain-portfolio-dev]
}

