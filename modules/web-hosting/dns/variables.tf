variable "route_53_zone" {
  description = "Zone name in Route 53"
  type        = string
}

variable "cert_record" {
  description = "The ssl certificate for this record would be created"
  type        = string
}

variable "alt_names" {
  description = "Allternative names for the cert record"
  type        = list(string)
  default     = []
}
