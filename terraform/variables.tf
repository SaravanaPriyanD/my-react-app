variable "region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project, used as a prefix for resource names and tags"
  type        = string
  default     = "sara-tf-react-project"
}

variable "environment" {
  description = "Deployment environment (e.g. production, staging, dev)"
  type        = string
  default     = "production"
}

variable "domain_name" {
  description = "Custom domain name for the CloudFront distribution. Leave empty to use the default CloudFront domain and certificate."
  type        = string
  default     = ""
}
