# Example of a provider using a version for this provider.

# Azure

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.41.0"
    }
  }
}

# AWS Provider

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 1.0.4"
    }
  }
}

# GCP Provider

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.51.0"
    }
  }
}