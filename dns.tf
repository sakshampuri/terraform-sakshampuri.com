module "dns-subdomains-sakshampuri" {
  source        = "./modules/web-hosting/dns"
  cert_record   = "*.sakshampuri.com"
  route_53_zone = var.route_53_zone
  env           = var.env-dev
}


module "dns-sakshampuri" {
  source        = "./modules/web-hosting/dns"
  cert_record   = "sakshampuri.com"
  route_53_zone = var.route_53_zone
  env           = var.env-prod
}

