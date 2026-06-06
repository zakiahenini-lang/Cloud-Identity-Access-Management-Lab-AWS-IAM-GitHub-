# Testing Guide

## Test Cases

### 1. developer-user can only read allowed resources

- Validate that `developer-user` can list IAM groups and view support resources.
- Confirm `developer-user` cannot modify IAM policies or create new users.
- Use `aws iam list-groups` and `aws iam get-group` to verify access.

### 2. security-auditor-user can inspect security-related configuration

- Validate that `security-auditor-user` can describe IAM roles, policies, and CloudTrail settings.
- Confirm the auditor cannot make configuration changes.
- Use `aws iam list-policies` and other read-only audit commands.

### 3. admin-user has elevated permissions but must use MFA

- Ensure `admin-user` belongs to the `Administrators` group.
- Confirm the admin policy is documented and reviewed.
- Use AWS Console or CLI with MFA-enabled session tokens for credential validation.

### 4. EC2 role can read S3 without static credentials

- Deploy an EC2 instance using the `EC2-S3-ReadOnly-Role` instance profile.
- Validate that the instance can read objects from a scoped S3 bucket.
- Confirm the instance does not require IAM access keys.

## Validation Steps

1. Run Terraform plan and apply.
2. Confirm outputs display created user, group, policy, and role names.
3. Use AWS CLI to inspect IAM configuration and policy attachments.
4. Review policy JSON files for least privilege.

## Notes

- Manual MFA setup is required after user creation.
- Additional tests may include access review documentation and audit logging verification.
