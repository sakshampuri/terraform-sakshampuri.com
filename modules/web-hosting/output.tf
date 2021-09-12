output "arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.www.arn
}

output "name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.www.id
}

output "domain" {
  description = "Domain name of the bucket"
  value       = aws_s3_bucket.www.website_domain
}

output "certificate_arn" {
  description = "ARN of the certificate for domain that is specified"
  value       = aws_acm_certificate_validation.validation.certificate_arn
}