# 6f Destroy Terraform managed infrastructure (terraform destroy)

## Summary

The terraform destroy command is used to destroy the Terraform-managed infrastructure.

## Usage

Usage: terraform destroy [options]

Infrastructure managed by Terraform will be destroyed. This will ask for confirmation before destroying.

This command accepts all the arguments and options that the apply command accepts, with the exception of a plan file argument.

If -auto-approve is set, then the destroy confirmation will not be shown.

The -target flag, instead of affecting "dependencies" will instead also destroy any resources that depend on the target(s) specified. For more information, see the targeting docs from terraform plan.

The behavior of any terraform destroy command can be previewed at any time with an equivalent terraform plan -destroy command.
