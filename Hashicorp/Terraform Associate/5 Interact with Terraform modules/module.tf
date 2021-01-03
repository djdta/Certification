# Example 1
module "name" {
  source = ""
  version = "value"
}

# Example 2
module "vpc" {
  source = "app.terraform.io/example_corp/vpc/aws"
  version = "0.9.3"
}

# Example 3