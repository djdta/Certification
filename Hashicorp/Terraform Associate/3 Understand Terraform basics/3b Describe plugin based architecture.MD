https://learn.hashicorp.com/tutorials/terraform/aws-build#initialize-the-directory

Initialize the directory
When you create a new configuration — or check out an existing configuration from version control — you need to initialize the directory with terraform init.

Terraform uses a plugin-based architecture to support hundreds of infrastructure and service providers. Initializing a configuration directory downloads and installs providers used in the configuration, which in this case is the aws provider. Subsequent commands will use local settings and data during initialization.

Initialize the directory.

$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 2.70"...
- Installing hashicorp/aws v2.70.0...
- Installed hashicorp/aws v2.70.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
Copy
Terraform downloads the aws provider and installs it in a hidden subdirectory of the current working directory. The output shows which version of the plugin was installed.