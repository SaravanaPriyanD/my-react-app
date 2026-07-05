---
name: user-role-devops-lead
description: User is a DevOps Lead at OCBC (financial institution), strategic/coordination-focused, AWS ap-southeast-1 primary region for their org's own workloads
metadata:
  type: user
---

User is a DevOps Lead at OCBC (a financial institution). Role is strategic and coordination-focused, not always hands-on day to day. Primary stack: Python, Terraform/HCL, Groovy (Jenkins), Bash. Primary AWS region for their organization's workloads is ap-southeast-1, using Bedrock, AgenticCore, ECR, Lambda, Aurora Serverless, SSM Parameter Store, IAM, ALB, ECS. CI/CD via Jenkins with shared libraries, DEV -> UAT -> PROD promotion.

Note: this personal `my-react-app` project uses `us-east-1` as its Terraform default region (required for CloudFront/ACM default cert workflow) — this is a deliberate per-project override, not a contradiction of the ap-southeast-1 org default.

**Why:** Established in global CLAUDE.md and confirmed through explicit region/project_name overrides given for this project's Terraform.

**How to apply:** Favor production-quality, no-overengineering Terraform; avoid defensive programming unless asked; keep explanations concise and lead with the key decision/trade-off when giving design options.
