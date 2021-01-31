## 7d Describe remote state storage mechanisms and supported standard backends

## Summary
Each Terraform configuration can specify a backend, which defines exactly where and how operations are performed, where state snapshots are stored, etc. Most non-trivial Terraform configurations configure a remote backend so that multiple people can work with the same infrastructure.

Using a Backend Block
Backends are configured with a nested backend block within the top-level terraform block:

```
terraform {
  backend "remote" {
    organization = "example_corp"

    workspaces {
      name = "my-app-prod"
    }
  }
}
```
There are some important limitations on backend configuration:

* A configuration can only provide one backend block.
* A backend block cannot refer to named values (like input variables, locals, or data source attributes).

## Backend Types
The block label of the backend block ("remote", in the example above) indicates which backend type to use. Terraform has a built-in selection of backends, and the configured backend must be available in the version of Terraform you are using.

The arguments used in the block's body are specific to the chosen backend type; they configure where and how the backend will store the configuration's state, and in some cases configure other behavior.

Some backends allow providing access credentials directly as part of the configuration for use in unusual situations, for pragmatic reasons. However, in normal use we do not recommend including access credentials as part of the backend configuration. Instead, leave those arguments completely unset and provide credentials via the credentials files or environment variables that are conventional for the target system, as described in the documentation for each backend.

See the list of backend types in the navigation sidebar for details about each supported backend type and its configuration arguments.