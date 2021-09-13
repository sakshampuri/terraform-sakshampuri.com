output "domain_name" {
  value       = aws_cloudfront_distribution.www_distribution.domain_name
  description = "Domain name of the delpoyed cloudfront distribution"
}

output "zone_id" {
  value       = aws_cloudfront_distribution.www_distribution.hosted_zone_id
  description = "Hosted zone id"
}