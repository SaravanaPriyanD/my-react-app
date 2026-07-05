---
name: project-react-spa-infra
description: Terraform for this repo's React SPA lives in terraform/ and follows a specific S3+CloudFront OAC pattern with defaults sara-tf-react-project / us-east-1
metadata:
  type: project
---

This repo (`my-react-app`) has a `terraform/` directory at the repo root provisioning S3 + CloudFront hosting for the React SPA build output.

Established defaults (do not change without explicit user request):
- `region` default: `us-east-1`
- `project_name` default: `sara-tf-react-project`
- `environment` default: `production`
- `domain_name` default: `""` (uses CloudFront default certificate)

Established conventions:
- Uses CloudFront Origin Access Control (OAC), not the legacy OAI.
- Bucket policy is built via `data "aws_iam_policy_document"` conditioned on `AWS:SourceArn` = the CloudFront distribution ARN — not a static/hardcoded ARN.
- Cache policy uses the AWS-managed `Managed-CachingOptimized` policy looked up via `data "aws_cloudfront_cache_policy"`, not inline forwarded_values.
- SPA routing handled via `custom_error_response` mapping 404 -> `/index.html` with response code 200.
- `backend.tf` ships with the S3 backend block fully commented out, with the 3-step bootstrap workflow documented (local init -> apply to create state bucket -> uncomment + `init -migrate-state`). Uses `use_lockfile = true` (S3-native locking, Terraform >= 1.10) rather than a DynamoDB lock table.
- Files split as: `providers.tf`, `main.tf`, `variables.tf`, `outputs.tf`, `backend.tf` — one resource group per file if it grows (e.g. a future `github-oidc.tf`).

**Why:** User (DevOps Lead at OCBC, see [[user_role_devops_lead]]) explicitly specified this file layout and these exact defaults/behaviors for the React SPA hosting stack.

**How to apply:** When asked to extend or modify this stack (e.g. add a custom domain, WAF, or CI/CD deploy step), preserve these defaults and patterns unless the user says otherwise.
