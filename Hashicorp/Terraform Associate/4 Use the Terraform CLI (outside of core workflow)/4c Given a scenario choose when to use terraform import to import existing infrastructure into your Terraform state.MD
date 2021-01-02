## 4c Given a scenario: choose when to use terraform import to import existing infrastructure into your Terraform state

#### Summary
Import will find the existing resource from ID and import it into your Terraform state at the given ADDRESS.

## Key Information

* ID is dependent on the resource type
* ADDRESS must be a valid resource address.

## Usage

Usage: terraform import [options] ADDRESS ID

#### Command Flags

* -backup=path - Path to backup the existing state file. Defaults to the -state-out path with the ".backup" extension. Set to "-" to disable backups.

* -config=path - Path to directory of Terraform configuration files that configure the provider for import. This defaults to your working directory. If this directory contains no Terraform configuration files, the provider must be configured via manual input or environmental variables.

* -input=true - Whether to ask for input for provider configuration.

* -lock=true - Lock the state file when locking is supported.

* -lock-timeout=0s - Duration to retry a state lock.

* -no-color - If specified, output won't contain any color.

* -parallelism=n - Limit the number of concurrent operation as Terraform walks the graph. Defaults to 10.

* -provider=provider - Deprecated Override the provider configuration to use when importing the object. By default, Terraform uses the provider specified in the configuration for the target resource, and that is the best behavior in most cases.

* -state=path - Path to the source state file to read from. Defaults to the configured backend, or "terraform.tfstate".

* -state-out=path - Path to the destination state file to write to. If this isn't specified the source state file will be used. This can be a new or existing path.

* -var 'foo=bar' - Set a variable in the Terraform configuration. This flag can be set multiple times. Variable values are interpreted as literal expressions in the Terraform language, so list and map values can be specified via this flag. This is only useful with the -config flag.

* -var-file=foo - Set variables in the Terraform configuration from a variable file. If a terraform.tfvars or any .auto.tfvars files are present in the current directory, they will be automatically loaded. terraform.tfvars is loaded first and the .auto.tfvars files after in alphabetical order. Any files specified by -var-file override any values set automatically from files in the working directory. This flag can be used multiple times. This is only useful with the -config flag.

* -ignore-remote-version - When using the enhanced remote backend with Terraform Cloud, continue even if remote and local Terraform versions differ. This may result in an unusable Terraform Cloud workspace, and should be used with extreme caution.

| Index |
|:----------:|
|[Template](https://www.terraform.io/docs/commands/import.html)|

