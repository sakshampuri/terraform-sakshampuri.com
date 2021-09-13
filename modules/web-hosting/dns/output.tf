output "certificate_arn" {
  description = "ARN of the certificate for domain that is specified"
  value       = aws_acm_certificate_validation.validation.certificate_arn
}

output "zone_id" {
  value       = data.aws_route53_zone.zone.id
  description = "The zone id of the hosted zone that is supplied"
}