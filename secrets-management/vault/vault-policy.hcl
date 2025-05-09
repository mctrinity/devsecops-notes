# Policy to allow read-only access to secrets under a specific path
path "secret/data/devops/*" {
  capabilities = ["read", "list"]
}

# Limit token use to prevent abuse
path "auth/token/lookup-self" {
  capabilities = ["read"]
}

# Optional: allow users to renew their own tokens
path "auth/token/renew-self" {
  capabilities = ["update"]
}
