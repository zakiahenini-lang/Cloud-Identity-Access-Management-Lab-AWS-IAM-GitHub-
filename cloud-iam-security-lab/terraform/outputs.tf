output "developer_user_name" {
  description = "IAM user name for the developer account."
  value       = aws_iam_user.developer_user.name
}

output "security_auditor_user_name" {
  description = "IAM user name for the security auditor account."
  value       = aws_iam_user.security_auditor_user.name
}

output "admin_user_name" {
  description = "IAM user name for the administrator account."
  value       = aws_iam_user.admin_user.name
}

output "developer_group_name" {
  description = "Name of the developers group."
  value       = aws_iam_group.developers.name
}

output "security_auditors_group_name" {
  description = "Name of the security auditors group."
  value       = aws_iam_group.security_auditors.name
}

output "administrators_group_name" {
  description = "Name of the administrators group."
  value       = aws_iam_group.administrators.name
}

output "developer_policy_arn" {
  description = "ARN of the developer read-only policy."
  value       = aws_iam_policy.developer_readonly.arn
}

output "security_audit_policy_arn" {
  description = "ARN of the security audit policy."
  value       = aws_iam_policy.security_audit.arn
}

output "ec2_s3_policy_arn" {
  description = "ARN of the EC2 S3 read-only policy."
  value       = aws_iam_policy.ec2_s3_readonly.arn
}

output "ec2_role_name" {
  description = "Name of the EC2 IAM role."
  value       = aws_iam_role.ec2_s3_readonly_role.name
}

output "ec2_instance_profile_name" {
  description = "Name of the EC2 instance profile."
  value       = aws_iam_instance_profile.ec2_readonly_profile.name
}
