# 🤝 Contributing Guide

Thank you for your interest in contributing to the DevSecOps Toolkit! This guide will help you get started and outline expectations for contributing code, policies, documentation, or improvements.

---

## 🧾 How to Contribute

### 1. Fork the Repository

Start by forking the project and cloning it locally:

```bash
git clone https://github.com/your-username/devsecops.git
cd devsecops
```

### 2. Create a Branch

Use a descriptive branch name:

```bash
git checkout -b fix/opa-policy-error
```

### 3. Make Your Changes

- Follow naming conventions
- Write clear, concise comments
- Include documentation and test files if applicable

### 4. Test Before You Push

Make sure:

- Policies pass Conftest
- Terraform plans cleanly
- Shell scripts are executable and linted

### 5. Submit a Pull Request

Push your branch and open a PR. Please include:

- A clear description of your changes
- Reference to any related issues (e.g., closes #42)
- Screenshots or logs (if relevant)

---

## 📦 Contribution Areas

We welcome contributions in the following areas:

- Terraform modules
- CI/CD pipelines (GitHub Actions, GitLab CI)
- OPA and Sentinel policies
- Container hardening (e.g., secure Dockerfiles)
- Monitoring/alerting configs
- Secrets management examples
- Documentation and examples

---

## ✅ Code Standards

- Keep code modular and reusable
- Follow DRY and least privilege principles
- Use secure defaults and parameterize inputs

---

## 📄 License

By contributing, you agree that your code will be licensed under the MIT License (see `LICENSE` file).

---

We appreciate your time and effort. Let’s make DevOps safer, together! 🚀
