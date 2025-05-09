# 🐳 Container Security

This directory contains secure container configurations and tools for vulnerability scanning.

---

## 📄 Dockerfile Overview

This `Dockerfile` builds a secure, minimal container image using [Distroless](https://github.com/GoogleContainerTools/distroless):

- **Base Image**: `gcr.io/distroless/static:nonroot`
- **Security Practices**:

  - Uses a non-root user
  - Minimal OS footprint (no shell, no package manager)
  - Copies a statically compiled binary (`myapp`) into `/app`

**To build the image:**

```bash
docker build -t myapp-secure -f Dockerfile .
```

**To run it:**

```bash
docker run --rm myapp-secure
```

---

## 🔍 Vulnerability Scanning with Trivy

Use [Trivy](https://github.com/aquasecurity/trivy) to scan this container image for vulnerabilities.

**Basic scan:**

```bash
trivy image myapp-secure
```

**With custom config:**

```bash
trivy image --config trivy-config.yaml myapp-secure
```

**GitHub Actions Integration:**
To use Trivy with a custom config in CI/CD:

```yaml
- name: Run Trivy with custom config
  uses: aquasecurity/trivy-action@master
  with:
    image-ref: "myapp-secure"
    config: ./containers/trivy-config.yaml
    format: "table"
    ignore-unfixed: true
    vuln-type: "os,library"
    severity: "HIGH,CRITICAL"
```

> Ensure the path to `trivy-config.yaml` is correct in your pipeline structure.

---

## 🔐 Best Practices

- **Avoid `latest` tags** in production
- **Pin exact base image versions** when possible
- **Run containers as non-root users**
- **Sign and verify images** using [Cosign](https://github.com/sigstore/cosign)
- **Use minimal base images** (e.g., `distroless`, `alpine`)

---

## 🧺 Optional: Static Binary

If you're using Go:

```bash
go build -ldflags="-s -w" -o myapp main.go
```

Then rebuild the container:

```bash
docker build -t myapp-secure .
```

---

## 📂 Files

```
containers/
├── Dockerfile             # Minimal, non-root, distroless container
├── trivy-config.yaml      # Optional config for customizing Trivy
├── README.md              # This file
└── test-data/             # (Optional) Sample files/images for scanning
```

Let your container be your fortress — ship it locked down. 🔒
