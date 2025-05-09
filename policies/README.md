# 🧪 Policy Testing Guide

This guide explains how to test OPA policies located in the `policies/` directory using [Conftest](https://www.conftest.dev/).

---

## 🗂️ Folder Structure

```
policies/
├── s3_public_block.rego
├── iam_least_privilege.rego
├── no_plaintext_secrets.rego
└── test-data/
    ├── s3_public_block.json
    ├── iam_least_privilege.json
    └── no_plaintext_secrets.json
```

---

## 🛠️ Requirements

Install [Conftest](https://www.conftest.dev/):

```bash
# macOS
brew install conftest

# Windows
choco install conftest

# Linux
wget https://github.com/open-policy-agent/conftest/releases/latest/download/conftest_Linux_x86_64.tar.gz
```

---

## 🚀 How to Run Policy Tests

From the root of the repo or inside the `policies/` folder:

```bash
conftest test test-data/ --policy .
```

This will evaluate all test input files against all policies and report any violations.

---

## 🧾 Sample Output

If a policy violation is found:

```
FAIL - test-data/no_plaintext_secrets.json - Secret variable 'secret' should not have a default value
FAIL - test-data/iam_least_privilege.json - IAM policies must not allow wildcard actions
FAIL - test-data/s3_public_block.json - S3 bucket must not be public
```

---

## ✅ Tips

- Each `.rego` file should have a corresponding test input file in `test-data/`
- Use descriptive messages in `deny[msg]` to make violations easy to understand
- Integrate these checks into CI pipelines to enforce policy before deployment

---

## 🔗 Resources

- [Open Policy Agent (OPA)](https://www.openpolicyagent.org/)
- [Conftest](https://www.conftest.dev/)
- [Policy Examples](https://www.openpolicyagent.org/docs/latest/policy-language/)
