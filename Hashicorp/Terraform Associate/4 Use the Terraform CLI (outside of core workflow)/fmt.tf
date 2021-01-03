# Example of what the fmt command can do to the terraform code

## Example 1

# Before
provider "aws" {
  version = "~> 3.0"
  region = "us-east-1"
}

# After
provider "aws" {
  version = "~> 3.0"
  region  = "us-east-1"
}

# Example 2

# Before
provider "aws" {
  region = "us-west-2"
  shared_credentials_file = "/Users/tf_user/.aws/creds"
  profile = "customprofile"
}

# After
provider "aws" {
  region                  = "us-west-2"
  shared_credentials_file = "/Users/tf_user/.aws/creds"
  profile                 = "customprofile"
}

# Example 3
