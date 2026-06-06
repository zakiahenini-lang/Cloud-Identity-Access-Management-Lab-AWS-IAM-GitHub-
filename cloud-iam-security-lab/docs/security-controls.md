# Security Controls

## Multi-Factor Authentication (MFA)

MFA is a critical control for privileged access. Terraform does not provision physical MFA devices, so MFA is documented as a manual security requirement for `admin-user` and other privileged identities.

## Least Privilege

Least privilege means granting only the permissions required for a role or user to perform their tasks. In this lab:

- Developers receive read-only access to relevant resources.
- Auditors receive security inspection permissions only.
- Admins have elevated permissions but are clearly documented.

## Role-Based Access Control (RBAC)

Grouping users by function reduces policy complexity and makes access reviews easier. This lab uses groups to apply policies consistently across similar job roles.

## Access Review

Regular access reviews help detect unused or over-permissioned accounts. Documenting group membership and policy intent supports audits and governance.

## No Root Account Usage

The AWS root account should not be used for daily operations. It should remain locked and protected by a strong password and MFA. All day-to-day access is managed through IAM users and roles.
