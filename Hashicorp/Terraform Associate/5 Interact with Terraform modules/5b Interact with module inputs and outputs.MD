# 5b Interact with module inputs and outputs

## Summary

When using a new module for the first time, you must run either terraform init or terraform get to install the module. When either of these commands are run, Terraform will install any new modules in the .terraform/modules directory within your configuration's working directory. For local modules, Terraform will create a symlink to the module's directory. Because of this, any changes to local modules will be effective immediately, without having to re-run terraform get.

### Key Information

* Some input variables are required, meaning that the module doesn't provide a default value
* Not all module input variables need to be set using variables in your configuration
* Module outputs are usually either passed to other parts of your configuration

#### Define root input variables

Using input variables with modules is very similar to how you use variables in any Terraform configuration. A common pattern is to identify which module input variables you might want to change in the future, and create matching variables in your configuration's variables.tf file with sensible default values. Those variables can then be passed to the module block as arguments.

Not all module input variables need to be set using variables in your configuration. For instance, you might want this VPC to always have a NAT gateway enabled, because the application you are provisioning requires it. In that case, using a variable to set enable_nat_gateway would be counterproductive.

You will need to define these variables in your configuration to use them.

If you have cloned the git repository mentioned earlier in this tutorial, your variables.tf will look like the below.

#### Define root output values

Modules also have output values, which are defined within the module with the output keyword. You can access them by referring to module.<MODULE NAME>.<OUTPUT NAME>. Like input variables, module outputs are listed under the outputs tab in the Terraform registry.

Module outputs are usually either passed to other parts of your configuration, or defined as outputs in your root module. You will see both uses in this tutorial.

| Index |
|:----------:|
|[Modules](https://learn.hashicorp.com/tutorials/terraform/module-use)|
