# 4d Given a scenario: choose when to use terraform workspace to create workspaces

#### Summary
Workspaces are managed with the terraform workspace set of commands. To create a new workspace and switch to it, you can use terraform workspace new; to switch workspaces you can use terraform workspace select; etc.

#### Key Information

* Every workspace has a separate state.
* Each workspace state file can be saved to a remote connection.
* To call a workspace use the following ${terraform.workspace}.

#### Usage

terraform workspace

* delete    Delete a workspace
* list      List Workspaces
* new       Create a new workspace
* select    Select a workspace
* show      Show the name of the current workspace

#### Using Workspaces
* terraform workspace new bar
* terraform workspace delete "The name of the workspace"
* terraform workspace select "The name of the workspace"
* terraform workspace list = "This list all the current workspaces created"
* terraform workspace show "This show the current workspace been used"

#### Workspace Interpolation

```resource "aws_instance" "example" {
  count = "${terraform.workspace == "default" ? 5 : 1}"

  ##### ... other arguments
}
```

```resource "aws_instance" "example" {
  tags = {
    Name = "web - ${terraform.workspace}"
  }

  # ... other arguments
}
```

| Index |
|:----------:|
|[Workspace](https://www.terraform.io/docs/state/workspaces.html)|
