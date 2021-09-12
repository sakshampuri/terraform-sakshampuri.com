resource "aws_s3_bucket" "www" {
  bucket = var.bucket_name
  acl    = "public-read"
  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${var.bucket_name}/*"]
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
    "Environment": var.env
  }

}