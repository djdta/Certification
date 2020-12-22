## 2B: Explain the Benefits of State


Purpose of Terraform State
Jump to Section
State is a necessary requirement for Terraform to function. It is often asked if it is possible for Terraform to work without state, or for Terraform to not use state and just inspect cloud resources on every run. This page will help explain why Terraform state is required.

As you'll see from the reasons below, state is required. And in the scenarios where Terraform may be able to get away without state, doing so would require shifting massive amounts of complexity from one place (state) to another place (the replacement concept).

* Terraform checks to see if there are any changes required to the actual environment to match the desired configuration.
* Terraform checks and tracks resource through State.
* Terraform builds Dependencies graph for resouces and it maintains the list in the state file.
* The representation of the current state of the world as Terraform understands it.
* Terraform checks any changes against the State.  Desired Configuration.
* Terraform will refresh the state before each planning run.
* Choosing not to refresh the state means that the reality of your infrastructure deployment may not match what is in the state file.  This can lead to inconsistent results when you apply the plan, or an outright failure. The risk of not refreshing state should be balanced against any performance improvements
* State keeps track of the version of an applied configuration, and it supports the locking of state
during updates.

## Key Notes
Terraform state enables the mapping of real world instances to resources in
a configuration, improved performance of the planning engine, and collaboration of teams.