## Example of providers

provider "google" {
  project = "acme-app"
  region  = "us-central1"
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