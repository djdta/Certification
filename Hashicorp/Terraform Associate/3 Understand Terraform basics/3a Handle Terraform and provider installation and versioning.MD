## 3a Handle Terraform and provider installation and versioning

Please view the providers.tf file to view examples of how this can be used.


Here below is some explains of versioning and please view the versioning.tf.

## Version Constraint Syntax

In this section below there is some example over versioning constraint

* Example 1

`` version = ">= 1.2.0, < 2.0.0" ``

The following operators are valid:

* = (or no operator): Allows only one exact version number. Cannot be combined with other conditions.

* !=: Excludes an exact version number.

* >, >=, <, <=: Comparisons against a specified version, allowing versions for which the comparison is true. "Greater-than" requests newer versions, and "less-than" requests older versions.

* ~>: Allows only the rightmost version component to increment. For example, to allow new patch releases within a specific minor release, use the full version number: ~> 1.0.4 will allow installation of 1.0.5 and 1.0.10 but not 1.1.0. This is usually called the pessimistic constraint operator.

## Terraform Core and Provider Versions
Reusable modules should constrain only their minimum allowed versions of Terraform and providers, such as >= 0.12.0. This helps avoid known incompatibilities, while allowing the user of the module flexibility to upgrade to newer versions of Terraform without altering the module.

Root modules should use a ~> constraint to set both a lower and upper bound on versions for each provider they depend on.

