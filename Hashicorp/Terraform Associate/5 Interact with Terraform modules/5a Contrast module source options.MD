# 5a Contrast module source options

## Summary

Every page on the registry has a search field for finding modules. Enter any type of module you're looking for (examples: "vault", "vpc", "database") and resulting modules will be listed. The search query will look at module name, provider, and description to match your search terms. On the results page, filters can be used further refine search results.

By default, only verified modules are shown in search results. Verified modules are reviewed by HashiCorp to ensure stability and compatibility. By using the filters, you can view unverified modules as well.

### Key Information

* By default, only verified modules are shown in search results
* Verified modules are reviewed by HashiCorp
* The syntax for specifying a registry module is <NAMESPACE>/<NAME>/<PROVIDER>. For example: hashicorp/consul/aws.
* Registry module sources are supported in Terraform v0.11.0 and newer.

## Using Modules

The Terraform Registry is integrated directly into Terraform, so a Terraform configuration can refer to any module published in the registry. The syntax for specifying a registry module is <NAMESPACE>/<NAME>/<PROVIDER>. For example: hashicorp/consul/aws.

Note: Module registry integration was added in Terraform v0.10.6, and full versioning support in v0.11.0.

When viewing a module on the registry on a tablet or desktop, usage instructions are shown on the right side. You can copy and paste this to get started with any module. Some modules have required inputs you must set before being able to use the module.

Please view the module.tf file fore examples.

The terraform init command will download and cache any modules referenced by a configuration.

## Private Registry Module Sources

You can also use modules from a private registry, like the one provided by Terraform Cloud. Private registry modules have source strings of the form <HOSTNAME>/<NAMESPACE>/<NAME>/<PROVIDER>. This is the same format as the public registry, but with an added hostname prefix.

Please view the file module.tf for examples.

Depending on the registry you're using, you might also need to configure credentials to access modules. See your registry's documentation for details. Terraform Cloud's private registry is documented here.

Private registry module sources are supported in Terraform v0.11.0 and newer.

## Module Versions

Each module in the registry is versioned. These versions syntactically must follow semantic versioning. In addition to pure syntax, we encourage all modules to follow the full guidelines of semantic versioning.

Terraform since version 0.11 will resolve any provided module version constraints and using them is highly recommended to avoid pulling in breaking changes.

Terraform versions after 0.10.6 but before 0.11 have partial support for the registry protocol, but always download the latest version instead of honoring version constraints.

| Index |
|:----------:|
|[Modules](https://www.terraform.io/docs/registry/modules/use.html)|
