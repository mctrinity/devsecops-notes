# 🔐 DevSecOps: Secure DevOps Pipeline (as Code)

This document describes a secure-by-default DevOps pipeline using infrastructure as code, container security, secrets management, and CI/CD hardening.

---

## 🧱 1. Infrastructure as Code (IaC) Security

**Tools**: Terraform, Checkov, tfsec

- Use least-privilege IAM policies
- Encrypt all data at rest and in transit
- Version resources (e.g., S3 buckets, EBS volumes)
- Scan IaC code with:

```bash
tfsec .
checkov -d .
```

**Example (Terraform S3 bucket)**:

```hcl
resource "aws_s3_bucket" "secure_bucket" {
  bucket = "my-secure-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  block_public_acls       = true
  block_public_policy     = true
}
```

---

## 🐳 2. Container Security

**Tools**: Trivy, Grype, Docker Bench

- Use minimal base images (`alpine`, `distroless`)
- Scan for vulnerabilities pre-deploy

```bash
trivy image myapp:latest
```

- Enforce image signing with [cosign](https://github.com/sigstore/cosign)

```bash
cosign sign --key cosign.key myapp:latest
```

---

## 🔐 3. Secrets Management

**Do not hardcode secrets.**

- Use:

  - AWS Secrets Manager
  - Azure Key Vault
  - HashiCorp Vault

**Best Practices**:

- Inject secrets into apps at runtime
- Rotate secrets regularly
- Store keys in secure stores, not Git

---

## 🧪 4. CI/CD Security Testing

**Pipeline Stages & Security Actions**:

| Stage      | Security Action                                |
| ---------- | ---------------------------------------------- |
| Pre-build  | Static code analysis (Semgrep, SonarQube)      |
| Build      | Dependency scan (Snyk, OWASP Dependency-Check) |
| Post-build | Container/image scan (Trivy, Clair, Grype)     |
| Deploy     | Policy check (OPA, Terraform Sentinel)         |

**Example GitHub Action**:

```yaml
- name: Run Trivy scan
  uses: aquasecurity/trivy-action@master
  with:
    image-ref: "myapp:latest"
```

---

## 🛡️ 5. Policy as Code

**Tool**: Open Policy Agent (OPA), Terraform Sentinel

- Prevent misconfigurations like public S3 buckets or admin roles

**Example Rego (OPA)**:

```rego
deny[msg] {
  input.resource.type == "aws_s3_bucket"
  input.resource.config.public == true
  msg = "S3 buckets must not be public"
}
```

---

## 🚧 6. Secure CI/CD Pipelines

- Use least privilege for pipeline runners
- Enable SSO + MFA for pipeline access
- Sign builds and verify them (e.g., with cosign + GitHub Actions)
- Rotate secrets used in pipelines

---

## 📊 7. Monitoring and Auditing

- Use log aggregation: ELK, Fluentd, CloudWatch Logs
- Monitor:

  - Auth events
  - IAM changes
  - Infrastructure drift

- Send alerts for high-severity CVEs or unusual access

---

## ✅ Final Recommendations

- Automate security scans in CI/CD
- Make security a shared responsibility between Dev, Sec, and Ops
- Keep security tools and libraries up to date
- Treat security policies as code — versioned, reviewed, and enforced
