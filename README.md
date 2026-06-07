# Cloud Identity & Access Management Lab (AWS IAM)

## Project Overview

This project is a practical cloud security lab focused on **Identity & Access Management (IAM)** in AWS.

The goal is to design and document a secure IAM structure based on the **Principle of Least Privilege**, using IAM users, groups, roles, MFA, and access policies.

This project is aligned with:

- Cloud Security
- Identity & Access Management
- Authentication
- User Management
- Access Management
- Cloud Governance
- Cloud Compliance
- Technical Documentation

---

## Why This Project Matters

Identity and Access Management is one of the most important areas in cloud security.

Many cloud security incidents happen because of weak authentication, excessive permissions, missing MFA, or poor access governance.

This lab demonstrates how to build a small but realistic AWS IAM environment and apply security best practices.

---

## Project Goals

- Create IAM users for different job roles.
- Create IAM groups for access management.
- Apply least-privilege IAM policies.
- Configure Multi-Factor Authentication as a security control.
- Create IAM roles for service-based access.
- Document the IAM architecture and access model.
- Build a professional cloud security portfolio project.

---

## Target Architecture

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
└── Security Controls
    ├── MFA for privileged users
    ├── Least privilege access model
    ├── Role-based access control
    └── Access review documentation
