module "s3-portfolio-prod" {
  source      = "../../modules/web-hosting/s3"
  bucket_name = "sakshampuri.com"
  env         = var.env-prod
  oai_arn     = module.cloudfront-portfolio-prod.oai_arn
}

module "cloudfront-portfolio-prod" {
  source          = "../../modules/web-hosting/cloudfront"
  env             = var.env-prod
  bucket_domain   = module.s3-portfolio-prod.bucket_regional_domain
  aliases         = [var.domain-portfolio-prod]
  certificate_arn = var.certificate_arn_prod
  origin_id       = var.domain-portfolio-prod
}

resource "aws_route53_record" "cf_to_s3-portfolio-prod" {
  zone_id = var.zone_id_prod
  name    = var.domain-portfolio-prod
  type    = "A"

  alias {
    name                   = module.cloudfront-portfolio-prod.domain_name
    zone_id                = module.cloudfront-portfolio-prod.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_CNAME" {
  zone_id = var.zone_id_prod
  name    = var.www_domain-portfolio-prod
  type    = "CNAME"
  ttl     = "60"
  records = [var.domain-portfolio-prod]
}
