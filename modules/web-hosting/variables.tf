variable "domain_name" {
  description = "The domain name without 'www' or root domain name"
  type        = string
}

variable "bucket_name" {
  description = "Name of S3 bucket which will house resources"
  type        = string
}

variable "env" {
  description = "The environment for this deployment"
  type        = string
  validation {
    condition     = contains(["prod", "dev", "test"], var.env)
    error_message = "Allowed values for input_parameter are \"prod\", \"dev\", or \"test\"."
  }
}

variable "route_53_zone" {
  description = "Zone name in Route 53"
  type        = string
}

variable "cert_record" {
  description = "The ssl certificate for this record would be created"
  type        = string
}