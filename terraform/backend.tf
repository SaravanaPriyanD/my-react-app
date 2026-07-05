# Backend bootstrap workflow:
#   1. Run `terraform init` with no backend configured (state stays local).
#   2. Run `terraform apply` to create the actual state bucket referenced
#      below (this is a one-time bootstrap step — the bucket cannot manage
#      the state of its own creation).
#   3. Uncomment the backend block below and run `terraform init -migrate-state`
#      to migrate local state into S3.
#
# This configuration uses S3-native state locking (use_lockfile), which
# requires Terraform >= 1.10 and removes the need for a separate DynamoDB
# lock table. If you're on an older Terraform version, replace
# `use_lockfile = true` with a `dynamodb_table = "<lock-table-name>"` argument
# instead.

# terraform {
#   backend "s3" {
#     bucket       = "sara-tf-react-project-tfstate"
#     key          = "terraform.tfstate"
#     region       = "us-east-1"
#     encrypt      = true
#     use_lockfile = true
#   }
# }
