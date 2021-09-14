variable "bucket_name" {
  default = "test.sakshampuri.com"
}

module "s3_test" {
  source      = "./modules/web-hosting/s3"
  bucket_name = var.bucket_name
  env         = var.env
  oai_arn     = module.cloudfront_test.oai_arn
}

module "cloudfront_test" {
  source          = "./modules/web-hosting/cloudfront"
  env             = var.env
  bucket_domain   = module.s3_test.bucket_regional_domain
  aliases         = ["test.sakshampuri.com"]
  certificate_arn = module.dns.certificate_arn
  origin_id       = "test.sakshampuri.com"
}

resource "aws_route53_record" "cf_to_s3_test" {
  zone_id = module.dns.zone_id
  name    = "test.sakshampuri.com"
  type    = "A"

  alias {
    name                   = module.cloudfront_test.domain_name
    zone_id                = module.cloudfront_test.zone_id
    evaluate_target_health = false
  }
}

output "cf_test_domain" {
  value = module.cloudfront_test.domain_name
}
