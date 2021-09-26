variable "env-prod" {
  default = "prod"
}

variable "domain-portfolio-prod" {
  default = "sakshampuri.com"
}

variable "www_domain-portfolio-prod" {
  default = "www.sakshampuri.com"
}

variable "zone_id_prod" {
  type        = string
  description = "Route 53 zone id for dev domains. If using defaults, it should correspond to zone id containing *.sakshampuri.com"
}

variable "certificate_arn_prod" {
  type        = string
  description = "Certificate ARN corresponding to domain of either dev.sakshampuri.com or *.sakshampuri.com"
}
