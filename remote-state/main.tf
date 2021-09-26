provider "aws" {
  region = "ap-south-1"
}

resource "aws_dynamodb_table" "terraform-sakshampuri-state-lock" {
  name           = "terraform-lock-sakshampuri"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "terraform-sakshampuri" {
  bucket = "terraform-sakshampuri"
  acl    = "private"

  tags = {
    Name = "terraform-sakshampuri"
  }
}
