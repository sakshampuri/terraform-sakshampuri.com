variable "env-dev" {
  default     = "dev"
  description = "defaults to dev"
}

variable "domain-portfolio-dev" {
  default     = "dev.sakshampuri.com"
  description = "defaults to dev.sakshampuri.com"
}

variable "www_domain-portfolio-dev" {
  default     = "www.dev.sakshampuri.com"
  description = "defaults to www.dev.sakshampuri.com"
}

variable "zone_id_dev" {
  type        = string
  description = "Route 53 zone id for dev domains. If using defaults, it should correspond to zone id containing *.sakshampuri.com"
}

variable "certificate_arn_dev" {
  type        = string
  description = "Certificate ARN corresponding to domain of either dev.sakshampuri.com or *.sakshampuri.com"
}
