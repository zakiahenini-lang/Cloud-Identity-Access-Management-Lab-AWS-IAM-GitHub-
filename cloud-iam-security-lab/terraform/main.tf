locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# IAM Groups for role-based access control
resource "aws_iam_group" "developers" {
  name = "Developers"
  path = "/"
  tags = local.common_tags
}

resource "aws_iam_group" "security_auditors" {
  name = "SecurityAuditors"
  path = "/"
  tags = local.common_tags
}

resource "aws_iam_group" "administrators" {
  name = "Administrators"
  path = "/"
  tags = local.common_tags
}

# IAM Users representing individual identities
resource "aws_iam_user" "developer_user" {
  name = "developer-user"
  path = "/"
  tags = local.common_tags
}

resource "aws_iam_user" "security_auditor_user" {
  name = "security-auditor-user"
  path = "/"
  tags = local.common_tags
}

resource "aws_iam_user" "admin_user" {
  name = "admin-user"
  path = "/"
  tags = local.common_tags
}

# Attach users to groups
resource "aws_iam_group_membership" "developer_membership" {
  name = "developers-membership"
  users = [aws_iam_user.developer_user.name]
  group = aws_iam_group.developers.name
}

resource "aws_iam_group_membership" "auditor_membership" {
  name = "auditors-membership"
  users = [aws_iam_user.security_auditor_user.name]
  group = aws_iam_group.security_auditors.name
}

resource "aws_iam_group_membership" "admin_membership" {
  name = "admins-membership"
  users = [aws_iam_user.admin_user.name]
  group = aws_iam_group.administrators.name
}

# Custom IAM policies for least privilege
resource "aws_iam_policy" "developer_readonly" {
  name        = "DeveloperReadOnlyPolicy"
  path        = "/"
  description = "Read-only permissions for developer access to supported AWS resources."
  policy      = file("${path.module}/policies/developer-readonly-policy.json")
  tags        = local.common_tags
}

resource "aws_iam_policy" "security_audit" {
  name        = "SecurityAuditPolicy"
  path        = "/"
  description = "Audit permissions to review IAM, CloudTrail, and security configuration."
  policy      = file("${path.module}/policies/security-audit-policy.json")
  tags        = local.common_tags
}

resource "aws_iam_policy" "ec2_s3_readonly" {
  name        = "EC2S3ReadOnlyPolicy"
  path        = "/"
  description = "S3 read-only policy for EC2 workloads using a role."
  policy      = file("${path.module}/policies/ec2-s3-readonly-policy.json")
  tags        = local.common_tags
}

resource "aws_iam_policy" "admin_policy" {
  name        = "AdministratorsPolicy"
  path        = "/"
  description = "Documented admin permissions for the administrator group. Use with caution and MFA."
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "AdminFullAccess"
        Effect = "Allow"
        Action = "*"
        Resource = "*"
      }
    ]
  })
  tags = local.common_tags
}

# Attach policies to groups
resource "aws_iam_group_policy_attachment" "developers_policy_attachment" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.developer_readonly.arn
}

resource "aws_iam_group_policy_attachment" "auditors_policy_attachment" {
  group      = aws_iam_group.security_auditors.name
  policy_arn = aws_iam_policy.security_audit.arn
}

resource "aws_iam_group_policy_attachment" "administrators_policy_attachment" {
  group      = aws_iam_group.administrators.name
  policy_arn = aws_iam_policy.admin_policy.arn
}

# IAM role for EC2 and workload access without hardcoded credentials
resource "aws_iam_role" "ec2_s3_readonly_role" {
  name               = "EC2-S3-ReadOnly-Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  tags = local.common_tags
}

resource "aws_iam_role_policy_attachment" "ec2_s3_policy_attachment" {
  role       = aws_iam_role.ec2_s3_readonly_role.name
  policy_arn = aws_iam_policy.ec2_s3_readonly.arn
}

# Instance profile for EC2 role association
resource "aws_iam_instance_profile" "ec2_readonly_profile" {
  name = "EC2-S3-ReadOnly-Profile"
  role = aws_iam_role.ec2_s3_readonly_role.name
  tags = local.common_tags
}

# Manual security control note: MFA must be configured outside of Terraform.
# Terraform can create IAM users and policies, but physical MFA devices require manual setup.
