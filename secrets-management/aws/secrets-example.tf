# Example: Create a secret in AWS Secrets Manager using Terraform

resource "aws_secretsmanager_secret" "devops_secret" {
  name        = "devops/api-key"
  description = "API key for internal DevOps tools"
}

resource "aws_secretsmanager_secret_version" "devops_secret_version" {
  secret_id = aws_secretsmanager_secret.devops_secret.id
  secret_string = jsonencode({
    api_key = var.api_key
  })
}

variable "api_key" {
  description = "API key value to store in Secrets Manager"
  type        = string
  sensitive   = true
}
