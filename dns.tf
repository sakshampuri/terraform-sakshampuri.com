module "dns-subdomains-sakshampuri" {
  source        = "./modules/web-hosting/dns"
  cert_record   = "*.sakshampuri.com"
  route_53_zone = var.route_53_zone
}


module "dns-sakshampuri" {
  source        = "./modules/web-hosting/dns"
  cert_record   = "sakshampuri.com"
  alt_names     = ["www.sakshampuri.com"]
  route_53_zone = var.route_53_zone
}

