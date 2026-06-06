# Cloud Identity & Access Management Lab (AWS IAM)

## Project Overview

This portfolio project is a practical AWS Identity and Access Management (IAM) lab focused on reusable cloud security engineering patterns. It demonstrates how to design a secure IAM architecture with users, groups, roles, custom policies, and governance controls using Terraform.

## Why This Project Matters

IAM is the foundation of cloud security. Poor permissions, insecure access controls, and weak authentication are common causes of cloud incidents. This lab shows how to apply the Principle of Least Privilege, enforce role-based access, and document security decisions for real-world audit readiness.

## Job-Role Relevance

This project is aligned with the following roles:

- Cloud Security Engineer
- IAM / Identity & Access Management Engineer
- DevSecOps Engineer
- Cloud Compliance Analyst
- Governance and Risk Engineer
- Security Operations / Audit Support

## Architecture

- `developer-user` assigned to the `Developers` group with read-only access to supported AWS services.
- `security-auditor-user` assigned to `SecurityAuditors` group with audit-specific permissions.
- `admin-user` assigned to `Administrators` group with elevated permissions documented for governance.
- `EC2-S3-ReadOnly-Role` provisioned for workload access without static credentials.

## Technologies Used

- Terraform
- AWS IAM
- AWS Provider
- JSON Policy Documents
- Markdown documentation

## IAM Concepts Covered

- IAM Users vs Groups vs Roles vs Policies
- Custom policy creation
- Role-based access control (RBAC)
- Least privilege access model
- Authentication vs Authorization
- Multi-Factor Authentication (MFA) as a security control
- Cloud governance and access review practices

## Repository Structure

```text
cloud-iam-security-lab/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── versions.tf
│   └── policies/
│       ├── developer-readonly-policy.json
│       ├── security-audit-policy.json
│       └── ec2-s3-readonly-policy.json
│
├── docs/
│   ├── architecture.md
│   ├── iam-design.md
│   ├── security-controls.md
│   ├── testing-guide.md
│   ├── lessons-learned.md
│   └── cv-description.md
│
├── diagrams/
│   └── architecture.drawio
│
└── screenshots/
    └── README.md
```

## Setup Instructions

1. Install Terraform (>= 1.5).
2. Configure AWS credentials in `~/.aws/credentials` or environment variables.
3. Update `terraform/variables.tf` values if needed.
4. Run Terraform commands from the `terraform` directory.

## Terraform Commands

```bash
cd cloud-iam-security-lab/terraform
terraform init
terraform validate
terraform plan -var='project_name=cloud-iam-security-lab' -var='aws_region=us-east-1' -var='environment=dev'
terraform apply -var='project_name=cloud-iam-security-lab' -var='aws_region=us-east-1' -var='environment=dev'
```

## Security Best Practices

- Use MFA for privileged user access.
- Keep admin permissions limited to a documented admin group.
- Prefer IAM roles for service access instead of long-term static credentials.
- Enforce periodic access review and governance.
- Avoid using the AWS root account for daily tasks.

## Testing Guide Summary

See `docs/testing-guide.md` for validation steps covering:
- developer access
- security auditor access
- admin access with MFA
- EC2 role access to S3 without static credentials

## Screenshots

Screenshots are not included in this version. Placeholders are in `screenshots/README.md` for future lab captures.

## CV Description

See `docs/cv-description.md` for a recruiter-friendly project summary and LinkedIn description.

## Disclaimer

This lab is intended for learning and documentation. It does not deploy production workloads or include actual credentials. All resources are IAM-only and safe for an AWS Free Tier-compatible sandbox.

## Project Status

- Status: Draft / Portfolio project
- Terraform code and documentation are ready for review and enhancement.
