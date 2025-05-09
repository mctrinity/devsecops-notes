# 🔐 Implementing Security via Code in DevOps (DevSecOps)

Implementing security via coding for DevOps is often called **“DevSecOps”** — it means **baking security into your infrastructure and automation code**, not just at the app level. This ensures that your systems are secure **by design and by default**.

---

## 🛠 1. Infrastructure as Code (IaC) Security

Use tools like **Terraform**, **CloudFormation**, or **Pulumi** to define your infrastructure, then:

- Enforce **least privilege** in IAM roles and policies
- Use **Terraform modules** with secure defaults
- Scan IaC with tools like:

  - `tfsec`
  - `Checkov`
  - `Terraform Cloud Sentinel`

**Example:**

```hcl
resource "aws_s3_bucket" "secure_bucket" {
  bucket = "my-secure-bucket"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }
}
```

---

## 🐳 2. Secure Container Images

- Use **minimal base images** (e.g., `alpine`, `distroless`)
- Scan images for vulnerabilities using:

  - `Trivy`
  - `Grype`
  - `Anchore`

- **Pin image versions** (avoid `:latest`)
- Use **signed images** with `cosign` / `Sigstore`

---

## 🔐 3. Secrets Management in Code

- **Never hardcode secrets** in source or config files.
- Use secure secrets managers:

  - HashiCorp Vault
  - AWS Secrets Manager
  - Azure Key Vault

- Use **environment injection** in CI/CD pipelines instead of inline variables.

---

## 🧪 4. Security Testing in CI/CD

Integrate security checks into your pipelines:

| Stage      | Security Action                                          |
| ---------- | -------------------------------------------------------- |
| Pre-build  | Static code analysis (e.g., SonarQube, Semgrep)          |
| Build      | Dependency scanning (e.g., Snyk, OWASP Dependency-Check) |
| Post-build | Container/image scanning (e.g., Trivy, Clair)            |
| Deploy     | Policy enforcement (e.g., OPA, Terraform Sentinel)       |

---

## 🚧 5. Policy as Code

Define and enforce security policies with code:

- **OPA (Open Policy Agent)** — for Kubernetes, APIs, CI/CD
- **Terraform Sentinel** — for IaC policies

**Example:** Block public S3 buckets or overly permissive IAM roles.

---

## 🌐 6. Secure CI/CD Pipelines

- Restrict permissions of CI/CD tools (GitHub Actions, GitLab CI, etc.)
- Use **signed commits** and **verified builds**
- Enable **MFA and SSO** for all accounts
- Monitor pipelines for **anomalies**

---

## 📈 7. Logging, Monitoring, and Auditing

- Set up **log aggregation** (e.g., ELK, Fluentd, CloudWatch)
- Send **alerts on suspicious activity**
- Include **security telemetry** in your observability stack

---

## ✅ Summary

Security for DevOps via code means **automating and enforcing best practices** through every stage — from **code**, to **build**, to **deploy** — using tools, policies, and secure defaults in your scripts and infrastructure definitions.
