# 🔐 Secrets Management

This folder provides secure, cloud-agnostic examples for managing secrets in DevSecOps workflows. Secrets include passwords, API keys, credentials, and sensitive config values that should never be hardcoded in code or stored in plain text.

---

## 📦 Tools Covered

- **HashiCorp Vault** — centralized secrets store with access policies
- **AWS Secrets Manager** — managed secrets storage with IAM integration
- **Azure Key Vault** — secure storage for secrets and keys with RBAC/Access Policies

---

## ✅ Best Practices

- ❌ Never hardcode secrets in source code or `.env` files
- 🔒 Use environment injection in CI/CD pipelines
- ✅ Apply least privilege access to secret backends
- 🔁 Rotate secrets regularly and audit access
- 📜 Version control **templates and policies**, not actual secrets

---

## 📂 Folder Structure

```
secrets-management/
├── vault/                      # HashiCorp Vault examples
│   └── vault-policy.hcl
├── azure/                      # Azure Key Vault config
│   └── keyvault-access-policy.json
├── aws/                        # AWS Secrets Manager with Terraform
│   └── secrets-example.tf
├── README.md                   # This guide
```

---

## ⚙️ Usage

### HashiCorp Vault

- Define ACL policies using HCL (see `vault-policy.hcl`)
- Enable AppRole or JWT-based authentication

### AWS Secrets Manager

- Use `secrets-example.tf` to create and manage secrets via Terraform
- Apply IAM roles/policies to restrict access

### Azure Key Vault

- Use `keyvault-access-policy.json` to define role or access policy
- Link secrets to Azure Functions, Logic Apps, or AKS with managed identity

---

## 🔗 Resources

- [Vault by HashiCorp](https://developer.hashicorp.com/vault/)
- [AWS Secrets Manager](https://docs.aws.amazon.com/secretsmanager/)
- [Azure Key Vault](https://learn.microsoft.com/en-us/azure/key-vault/)

Keep secrets safe, automated, and auditable 🔐
