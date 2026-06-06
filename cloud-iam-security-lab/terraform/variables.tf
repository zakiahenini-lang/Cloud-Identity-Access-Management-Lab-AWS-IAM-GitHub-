variable "project_name" {
  description = "The name of the project used for tags and naming conventions."
  type        = string
  default     = "cloud-iam-security-lab"
}

variable "aws_region" {
  description = "AWS region for the IAM resources."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment tag."
  type        = string
  default     = "dev"
}
