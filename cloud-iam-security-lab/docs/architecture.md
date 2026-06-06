# Architecture

## AWS IAM Lab Architecture

This AWS IAM lab uses a simple but realistic identity design to demonstrate secure access management and governance.

```text
AWS Account

├── IAM Users
│   ├── developer-user
│   ├── security-auditor-user
│   └── admin-user
│
├── IAM Groups
│   ├── Developers
│   ├── SecurityAuditors
│   └── Administrators
│
├── IAM Policies
│   ├── DeveloperReadOnlyPolicy
│   ├── SecurityAuditPolicy
│   └── EC2S3ReadOnlyPolicy
│
├── IAM Role
│   └── EC2-S3-ReadOnly-Role
│
└── Governance Controls
    ├── MFA required for privileged users
    ├── Least privilege policy design
    ├── Access review process
    └── No root account usage for daily tasks
```

## Design Summary

- `developer-user` is a standard identity for engineers and is placed in the `Developers` group.
- `security-auditor-user` is scoped to security audit permissions and grouped under `SecurityAuditors`.
- `admin-user` is part of the `Administrators` group for documented elevated access.
- `EC2-S3-ReadOnly-Role` is designed for compute workloads to access S3 without long-term credentials.

## Why This Architecture Works

- Clear separation of duties between developers, auditors, and administrators.
- Minimal access for each identity based on job responsibilities.
- Policies are custom and scoped to only required actions.
- Roles are used for service access to avoid static credentials.
