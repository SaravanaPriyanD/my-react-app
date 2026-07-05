output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution serving the static site"
  value       = aws_cloudfront_distribution.site.id
}

output "cloudfront_domain_name" {
  description = "Default CloudFront domain name for the distribution"
  value       = aws_cloudfront_distribution.site.domain_name
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket hosting the site content"
  value       = aws_s3_bucket.site.bucket
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket hosting the site content"
  value       = aws_s3_bucket.site.arn
}

output "github_actions_role_arn" {
  description = "ARN of the IAM role assumed by GitHub Actions for CI/CD deploys"
  value       = aws_iam_role.github_actions_deploy.arn
}
