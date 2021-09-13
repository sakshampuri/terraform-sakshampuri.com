variable "aliases" {
  description = "Aliases for domain to assign to cloudfront distribution"
  type        = list(string)
}

variable "origin_id" {
  description = "Unique identifier for the cloudfront origin"
  type        = string
}

variable "certificate_arn" {
  description = "The certificate ARN corresponding to the aliases supplied"
  type        = string
}

variable "bucket_domain" {
  description = "The domain pointing to s3 bucket. Not the static website hosted domain."
  type        = string
}

variable "env" {
  description = "Environment"
  type        = string
}