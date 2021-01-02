## Example of providers

provider "google" {
  project = "acme-app"
  region  = "us-central1"
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.51.0"
    }
  }
}

# The default provider configuration; resources that begin with `aws_` will use
# it as the default, and it can be referenced as `aws`.
provider "aws" {
  region = "us-east-1"
}

# Additional provider configuration for west coast region; resources can
# reference this as `aws.west`.
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 1.0.4"
    }
  }
}

# Able to reference a provider
resource "aws_instance" "foo" {
  provider = aws.west

  # ...
}

# Module example for alias to providers
module "aws_vpc" {
  source = "./aws_vpc"
  providers = {
    aws = aws.west
  }
}

#### Azure Provider Details
provider "azurerm" {
  version = "=2.40.0"
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.41.0"
    }
  }
}