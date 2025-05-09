variable "aws_region" {
  description = "AWS region for the bucket"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Unique S3 bucket name"
  type        = string
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Owner tag for the bucket"
  type        = string
}
