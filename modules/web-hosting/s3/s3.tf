resource "aws_s3_bucket" "www" {
  bucket = var.bucket_name
  acl    = var.block_public_access == true ? "private" : "public-read"
  policy = var.bucket_policy != null ? var.bucket_policy : <<POLICY
{
    "Version": "2012-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Effect": "Allow",
            "Sid":"AddPerm",
            "Principal": {
                "AWS": "${var.oai_arn}"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${var.bucket_name}/*"
        }
    ]
}
POLICY

  versioning {
    enabled = true
  }

  tags = {
    "Terraform" : true
    "Category" : "WEB"
    "Environment" : var.env
  }

}

resource "aws_s3_bucket_public_access_block" "bucket_public_access_control" {
  bucket = var.bucket_name

  block_public_acls       = var.block_public_access
  block_public_policy     = var.block_public_access
  restrict_public_buckets = var.block_public_access
  ignore_public_acls      = var.block_public_access

}