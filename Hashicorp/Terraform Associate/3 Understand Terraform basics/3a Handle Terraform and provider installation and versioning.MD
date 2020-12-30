## 3a Handle Terraform and provider installation and versioning

Here below is some explains of provider installations and versioning.

#### Google Provider Example


``provider "google" {
  project = "acme-app"
  region  = "us-central1"
}``

``terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.51.0"
    }
  }
}``

``provider "google" {
}``


#### AWS Example of Provider
``provider "aws" {
  region = "us-east-1"
}``

``terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 1.0.4"
    }
  }
}``

##### Additional provider configuration for west coast region; resources can
##### reference this as `aws.west`.
``provider "aws" {
  alias  = "west"
  region = "us-west-2"
}``

#### Azure Provider Details

``terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.41.0"
    }
  }
}``

``provider "azurerm" {
}``

#### Configure the Azure Provider

``provider "azurerm" {
  version = "=2.40.0"
  features {}
}``

## Version Constraint Syntax

In this section below there is some example over versioning constraint

* Example 1

`` version = ">= 1.2.0, < 2.0.0" ``

The following operators are valid:

= (or no operator): Allows only one exact version number. Cannot be combined with other conditions.

!=: Excludes an exact version number.

>, >=, <, <=: Comparisons against a specified version, allowing versions for which the comparison is true. "Greater-than" requests newer versions, and "less-than" requests older versions.

~>: Allows only the rightmost version component to increment. For example, to allow new patch releases within a specific minor release, use the full version number: ~> 1.0.4 will allow installation of 1.0.5 and 1.0.10 but not 1.1.0. This is usually called the pessimistic constraint operator.

## Terraform Core and Provider Versions
Reusable modules should constrain only their minimum allowed versions of Terraform and providers, such as >= 0.12.0. This helps avoid known incompatibilities, while allowing the user of the module flexibility to upgrade to newer versions of Terraform without altering the module.

Root modules should use a ~> constraint to set both a lower and upper bound on versions for each provider they depend on.

