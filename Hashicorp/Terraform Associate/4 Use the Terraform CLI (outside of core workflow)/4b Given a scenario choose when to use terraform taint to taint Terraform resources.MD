## 4b Given a scenario: choose when to use terraform taint to taint Terraform resources

#### Summary
The terraform taint command manually marks a Terraform-managed resource as tainted, forcing it to be destroyed and recreated on the next apply.

This command will not modify infrastructure, but does modify the state file in order to mark a resource as tainted. Once a resource is marked as tainted, the next plan will show that the resource will be destroyed and recreated and the next apply will implement this change.

## Key Information

* Forcing the recreation of a resource.
* Resource for recreation may affect resources that depend on the newly tainted resource.
* This command will not modify infrastructure, but does modify the state file in order to mark a resource as tainted.

## Usage

Usage: terraform taint [options] address

The address argument is the address of the resource to mark as tainted. The address is in the resource address syntax syntax, as shown in the output from other commands, such as:

* aws_instance.foo
* aws_instance.bar[1]
* aws_instance.baz[\"key\"] (quotes in resource addresses must be escaped on the command line, so that they are not interpreted by your shell)
* module.foo.module.bar.aws_instance.qux

#### Command Flags

* -allow-missing - If specified, the command will succeed (exit code 0) even if the resource is missing. The command can still error, but only in critically erroneous cases.

* -backup=path - Path to the backup file. Defaults to -state-out with the ".backup" extension. Disabled by setting to "-".

* -lock=true - Lock the state file when locking is supported.

* -lock-timeout=0s - Duration to retry a state lock.

* -state=path - Path to read and write the state file to. Defaults to "terraform.tfstate". Ignored when remote state is used.

* -state-out=path - Path to write updated state file. By default, the -state path will be used. Ignored when remote state is used.

* -ignore-remote-version - When using the enhanced remote backend with Terraform Cloud, continue even if remote and local Terraform versions differ. This may result in an unusable Terraform Cloud workspace, and should be used with extreme caution.

#### Example: Tainting a Single Resource

terraform taint aws_security_group.allow_all

#### Example: Tainting a single resource created with for_each

terraform taint 'module.route_tables.azurerm_route_table.rt["DefaultSubnet"]'

#### Example: Tainting a Resource within a Module

terraform taint "module.couchbase.aws_instance.cb_node[9]"
terraform taint "module.child.module.grandchild.aws_instance.example[2]"

| Index |
|:----------:|
|[Template](https://www.terraform.io/docs/commands/taint.html)|