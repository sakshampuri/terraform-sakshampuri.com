output "bucket_domain" {
  description = "The domain pointing to the root of s3 bucket."
  value       = aws_s3_bucket.www.bucket_domain_name
}

output "bucket_regional_domain" {
  description = "The regional domain of s3 bucket pointing to root."
  value       = aws_s3_bucket.www.bucket_regional_domain_name
}