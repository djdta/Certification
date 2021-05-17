# 6a Describe Terraform workflow ( Write -> Plan -> Create )

## Summary

The core Terraform workflow has three steps:

Write - Author infrastructure as code.

Plan - Preview changes before applying.

Apply - Provision reproducible infrastructure.

This guide walks through how each of these three steps plays out in the context of working as an individual practitioner, how they evolve when a team is collaborating on infrastructure, and how Terraform Cloud enables this workflow to run smoothly for entire organizations.

## Write

You write Terraform configuration just like you write code: in your editor of choice. It's common practice to store your work in a version controlled repository even when you're just operating as an individual.

```
# Create repository
$ git init my-infra && cd my-infra

Initialized empty Git repository in /.../my-infra/.git/

# Write initial config
$ vim main.tf

# Initialize Terraform
$ terraform init

Initializing provider plugins...
# ...
Terraform has been successfully initialized!
```

As you make progress on authoring your config, repeatedly running plans can help flush out syntax errors and ensure that your config is coming together as you expect.

```
# Make edits to config
$ vim main.tf

# Review plan
$ terraform plan

# Make additional edits, and repeat
$ vim main.tf

```
This parallels working on application code as an individual, where a tight feedback loop between editing code and running test commands is useful.

## Plan

When the feedback loop of the Write step has yielded a change that looks good, it's time to commit your work and review the final plan.

```
$ git add main.tf
$ git commit -m 'Managing infrastructure as code!'

[master (root-commit) f735520] Managing infrastructure as code!
 1 file changed, 1 insertion(+)
```

Because terraform apply will display a plan for confirmation before proceeding to change any infrastructure, that's the command you run for final review.

```
$ terraform apply

An execution plan has been generated and is shown below.
# ...
```

## Apply

After one last check, you are ready to tell Terraform to provision real infrastructure.

```
Do you want to perform these actions?

  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.
  Enter a value: yes

# ...

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

At this point, it's common to push your version control repository to a remote location for safekeeping.

```
$ git remote add origin https://github.com/*user*/*repo*.git
$ git push origin master
```

This core workflow is a loop; the next time you want to make changes, you start the process over from the beginning.

Notice how closely this workflow parallels the process of writing application code or scripts as an individual? This is what we mean when we talk about Terraform enabling infrastructure as code.