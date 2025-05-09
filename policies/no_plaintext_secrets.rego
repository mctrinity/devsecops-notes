package policy

deny[msg] {
  input.resource.type == "terraform_variable"
  input.resource.config.name == "secret"
  input.resource.config.default != null
  msg = sprintf("Secret variable '%s' should not have a default value", [input.resource.config.name])
}
