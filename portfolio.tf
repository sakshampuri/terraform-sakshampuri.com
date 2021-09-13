module "s3" {
  source      = "./modules/web-hosting/s3"
  bucket_name = "dev.sakshampuri.com"
  env         = var.env
}

module "dns" {
  source        = "./modules/web-hosting/dns"
  cert_record   = "*.sakshampuri.com"
  route_53_zone = var.route_53_zone
  env           = var.env
}

module "cloudfront" {
  source          = "./modules/web-hosting/cloudfront"
  env             = var.env
  bucket_domain   = module.s3.bucket_regional_domain
  aliases         = [var.domain]
  certificate_arn = module.dns.certificate_arn
  origin_id       = var.domain
}

resource "aws_route53_record" "cf_to_s3" {
  zone_id = module.dns.zone_id
  name    = var.domain
  type    = "A"

  alias {
    name                   = module.cloudfront.domain_name
    zone_id                = module.cloudfront.zone_id
    evaluate_target_health = false
  }
}