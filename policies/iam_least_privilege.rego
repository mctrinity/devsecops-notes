package policy

deny[msg] {
  input.resource.type == "aws_iam_policy"
  some i
  input.resource.config.policy.Document.Statement[i].Action == "*"
  msg = "IAM policies must not allow wildcard actions"
}
