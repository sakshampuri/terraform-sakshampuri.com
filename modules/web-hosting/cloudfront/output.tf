output "domain_name" {
  value       = aws_cloudfront_distribution.www_distribution.domain_name
  description = "Domain name of the delpoyed cloudfront distribution"
}

output "zone_id" {
  value       = aws_cloudfront_distribution.www_distribution.hosted_zone_id
  description = "Hosted zone id"
}

output "oai_id" {
  description = "The ID of OAI created in association with this distribution"
  value       = aws_cloudfront_origin_access_identity.www_OAI.id
}

output "oai_arn" {
  description = "The ARN of OAI created in association with this distribution"
  value       = aws_cloudfront_origin_access_identity.www_OAI.iam_arn
}