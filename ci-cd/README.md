# 📘 CI/CD Pipeline Overview

This document describes the structure and usage of the secure CI/CD pipeline defined in the `ci-cd/github-actions/secure-pipeline.yml` file.

---

## 🧭 Purpose

The pipeline implements DevSecOps practices by integrating:

- **Security scanning** with tfsec and Trivy
- **Infrastructure provisioning** using Terraform
- **OPA policy validation** for compliance
- **Manual approval** for production deployments

---

## 📂 Pipeline Structure

### 1. `security-scan`

Runs security checks:

- `tfsec` scans Terraform code
- `Trivy` scans the local filesystem and Docker image for vulnerabilities

### 2. `terraform-plan`

- Initializes and plans Terraform deployment
- Stores plan output as an artifact

### 3. `terraform-apply`

- Downloads the stored Terraform plan
- Applies it to provision resources
- Runs **only on the `main` branch**
- Targets the `production` environment

### 4. `opa-policy-check`

- Installs and runs Conftest to enforce OPA policies on Terraform files

---

## ✅ Manual Approval for Production

This pipeline uses GitHub's **environment protection rules** to require manual approval before deploying to production.

### To enable approval:

1. Go to your repository on GitHub
2. Click **Settings** > **Environments**
3. Select or create an environment named `production`
4. Under **Deployment protection rules**, enable **Required reviewers**
5. Add appropriate team members as reviewers

Once configured, GitHub will **pause `terraform-apply`** and wait for an authorized user to approve it in the **Actions** tab.

---

## 🔄 Triggering the Pipeline

The pipeline runs on:

- Push to `main`
- Pull requests targeting `main`

---

## 📌 Notes

- Ensure your Terraform state and backend are correctly configured in the `terraform/` directory.
- All CI tools use the latest trusted releases.
- Secrets and environment-specific configurations should be handled using GitHub Secrets or environment variables.

---

For full pipeline details, see: [`secure-pipeline.yml`](./github-actions/secure-pipeline.yml)
