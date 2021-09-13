resource "aws_cloudfront_origin_access_identity" "www_OAI" {
  comment = "Web hosting OAI"
}

resource "aws_cloudfront_distribution" "www_distribution" {

  origin {

    connection_timeout  = 5
    connection_attempts = 2

    domain_name = var.bucket_domain

    origin_id = var.origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.www_OAI.cloudfront_access_identity_path
    }

  }

  enabled             = true
  default_root_object = "index.html"

  // All values are defaults from the AWS console.
  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    // This needs to match the `origin_id` above.
    target_origin_id = var.origin_id
    min_ttl          = 0
    default_ttl      = 60
    max_ttl          = 120

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  aliases = var.aliases

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  // Here's where our certificate is loaded in!
  viewer_certificate {
    acm_certificate_arn = var.certificate_arn
    ssl_support_method  = "sni-only"
  }

  tags = {
    Terraform   = true
    Environment = var.env
  }
}