variable "bucket_name" {
  description = "Name of S3 bucket which will house resources"
  type        = string
}

variable "env" {
  description = "Environment"
  type        = string
}

variable "oai_arn" {
  description = "The ARN for OAI to attach to S3 policy. Can be omitted if setting block_public_access as false"
  default     = ""
  type        = string
}

variable "bucket_policy" {
  description = "Policy of bucket. By default attaches public policy for s3:GetObject."
  type        = string
  default     = null
}

variable "block_public_access" {
  description = "Whether or not to block public access. Defaults to true."
  type        = bool
  default     = true
}