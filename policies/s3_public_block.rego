package policy

deny[msg] {
  input.resource.type == "aws_s3_bucket"
  input.resource.config.public == true
  msg = "S3 bucket must not be public"
}
