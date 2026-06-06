# IAM Design

## IAM Users, Groups, Roles, and Policies

- **IAM Users** represent individual people or service accounts. In this lab, users are named `developer-user`, `security-auditor-user`, and `admin-user`.
- **IAM Groups** make permission management easier by assigning users to logical collections. This lab includes `Developers`, `SecurityAuditors`, and `Administrators`.
- **IAM Roles** are identities that AWS services or trusted entities can assume. Roles avoid hardcoded credentials and are the recommended pattern for compute workloads.
- **IAM Policies** are JSON documents that define permissions. Policies can be attached to users, groups, or roles.

## Access Model

- `Developers` group receives the custom `DeveloperReadOnlyPolicy`.
- `SecurityAuditors` group receives `SecurityAuditPolicy`.
- `Administrators` group receives an elevated admin policy with documented intent.
- `EC2-S3-ReadOnly-Role` receives `EC2S3ReadOnlyPolicy` for workload access.

## Authentication vs Authorization

- **Authentication** answers: Who are you? This lab recommends MFA for strong verification of the user identity.
- **Authorization** answers: What are you allowed to do? Authorization is enforced through policies, groups, and roles.

## Why Roles Over Hardcoded Credentials

IAM roles are better than long-term access keys because roles:

- Can be assumed temporarily by AWS resources.
- Eliminate secrets stored in code or instance metadata.
- Support fine-grained permissions and session policies.
- Are easier to rotate and audit.

## Policy Scope and Least Privilege

This lab follows the Principle of Least Privilege by giving each identity only the permissions needed for its responsibilities. The admin group is intentionally elevated and documented, while regular users are limited to read-only or audit actions.
