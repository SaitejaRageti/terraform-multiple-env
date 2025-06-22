# 🌐 Environment Management with Terraform Workspaces


To manage infrastructure across different environments (dev, prod), Terraform workspaces were used in combination with remote state storage on Amazon S3.

🛠️ Setup Details
📁 Remote Backend Configuration (S3)

In provider.tf, remote backend was configured as follows:


terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "your key"
    region = "us-east-1"
    use_lockfile = true
    encrypt        = true
  }
}



💡 Note: The actual workspace name is automatically appended to the key by Terraform when using workspaces. For example, with the key set to ec2/statefile.tfstate:

Dev workspace → key/env/dev/terraform.tfstate

Prod workspace → key/env/prod/terraform.tfstate

Terraform automatically handles storing the state file in a subdirectory structure like:



s3://your-terraform-state-bucket/key/env/dev/terraform.tfstate

s3://your-terraform-state-bucket/key/env/prod/terraform.tfstat



🔁 Workspace Commands Used


terraform workspace new dev 
terraform workspace new prod

terraform workspace select dev   # switch to dev
terraform apply                  # deploy to dev

terraform workspace select prod  # switch to prod
terraform apply                  # deploy to prod


Each workspace maintains an isolated state file, allowing you to create resources with the same configuration but in different environments.

✅ Pros and ❌ Cons of Using Terraform Workspaces


✅ Pros
Environment Isolation: Each workspace has a separate state file, reducing the risk of cross-environment changes.

Code Reuse: Use the same Terraform configuration to deploy infrastructure to multiple environments.

Simplified State Management: Automatically handles directory structure for storing state in remote backends like S3.

❌ Cons
Limited Flexibility for Complex Environments: Workspaces are not ideal for managing entirely different infrastructure across environments (e.g., different VPCs, regions).

Hidden Workspace Context: It’s easy to forget which workspace you're in — mistakes can happen if you're not careful.

Not a Substitute for Full Multi-Environment Design: For complex projects, a folder-based structure (e.g., /env/dev/, /env/prod/) with separate backends might be more transparent.