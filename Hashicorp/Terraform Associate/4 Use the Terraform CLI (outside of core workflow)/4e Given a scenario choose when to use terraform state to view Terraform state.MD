## 4e Given a scenario: choose when to use terraform state to view Terraform state

#### Summary
The terraform state command is used for advanced state management. As your Terraform usage becomes more advanced, there are some cases where you may need to modify the Terraform state. Rather than modify the state directly, the terraform state commands can be used in many cases instead.

This command is a nested subcommand, meaning that it has further subcommands. These subcommands are listed to the left.

#### Key Information

* All terraform state subcommands that modify the state write backup files.
* Terraform state subcommands all work with remote state.
* State id based on desired state of the environment.
* Management State is a advance topic.

#### Usage

Usage: terraform state <subcommand> [options] [args]

* list                List resources in the state
* mv                  Move an item in the state
* pull                Pull current state and output to stdout
* push                Update remote state from a local state file
* replace-provider    Replace provider in the state
* rm                  Remove instances from the state
* show                Show a resource in the state

#### Remote State

The Terraform state subcommands all work with remote state just as if it was local state. Reads and writes may take longer than normal as each read and each write do a full network roundtrip. Otherwise, backups are still written to disk and the CLI usage is the same as if it were local state.

| Index |
|:----------:|
|[State](https://www.terraform.io/docs/commands/state/index.html)|
