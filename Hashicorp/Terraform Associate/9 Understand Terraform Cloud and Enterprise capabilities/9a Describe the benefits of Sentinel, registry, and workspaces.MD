# 9a Describe the benefits of Sentinel, registry, and workspaces

## Summary

Sentinel is an embedded policy-as-code framework integrated with the HashiCorp Enterprise products. It enables fine-grained, logic-based policy decisions, and can be extended to use information from external sources.

To learn how to use Sentinel and begin writing policies with the Sentinel language, see the Sentinel documentation.

You can also use the tfe_sentinel_policy resource from the Terraform Enterprise provider to upload a policy using Terraform itself.

»Sentinel in Terraform Cloud
Sentinel now supports native VCS integration and direct policy set uploads. See Managing policies for organizations for details or to read about the migration utility.

Using Sentinel with Terraform Cloud involves:

Defining the policies - Policies are defined using the policy language with imports for parsing the Terraform plan, state and configuration.
Managing policies for organizations - Users with permission to manage policies can add policies to their organization by configuring VCS integration or uploading policy sets through the API. They also define which workspaces the policy sets are checked against during runs. (More about permissions.)
Enforcing policy checks on runs - Policies are checked when a run is performed, after the terraform plan but before it can be confirmed or the terraform apply is executed.
Mocking Sentinel Terraform data - Terraform Cloud provides the ability to generate mock data for any run within a workspace. This data can be used with the Sentinel CLI to test policies before deployment.

## Standard Imports

The Terraform integration for HashiCorp Sentinel implements all of the available standard imports.

## Private Module Registry

Terraform Cloud's private module registry helps you share Terraform modules across your organization. It includes support for module versioning, a searchable and filterable list of available modules, and a configuration designer to help you build new workspaces faster.

By design, the private module registry works much like the public Terraform Registry. If you're already used the public registry, Terraform Cloud's registry will feel familiar.

Workspaces
Jump to Section
Hands-on: Try the Get Started - Terraform Cloud collection on HashiCorp Learn.

Workspaces are how Terraform Cloud organizes infrastructure.

## Workspaces are Collections of Infrastructure

Working with Terraform involves managing collections of infrastructure resources, and most organizations manage many different collections.

When run locally, Terraform manages each collection of infrastructure with a persistent working directory, which contains a configuration, state data, and variables. Since Terraform CLI uses content from the directory it runs in, you can organize infrastructure resources into meaningful groups by keeping their configurations in separate directories.

Terraform Cloud manages infrastructure collections with workspaces instead of directories. A workspace contains everything Terraform needs to manage a given collection of infrastructure, and separate workspaces function like completely separate working directories.

Note: Terraform Cloud and Terraform CLI both have features called "workspaces," but they're slightly different. CLI workspaces are alternate state files in the same working directory; they're a convenience feature for using one configuration to manage multiple similar groups of resources.

API: See the Workspaces API.

## Workspace Contents

Terraform Cloud workspaces and local working directories serve the same purpose, but they store their data differently:

Component Local Terraform Terraform Cloud
Terraform configuration On disk In linked version control repository, or periodically uploaded via API/CLI
Variable values As .tfvars files, as CLI arguments, or in shell environment In workspace
State On disk or in remote backend In workspace Credentials and secrets In shell environment or entered at prompts In workspace, stored as sensitive variables
In addition to the basic Terraform content, Terraform Cloud keeps some additional data for each workspace:

State versions: Each workspace retains backups of its previous state files. Although only the current state is necessary for managing resources, the state history can be useful for tracking changes over time or recovering from problems. (See also: State.)

Run history: When Terraform Cloud manages a workspace's Terraform runs, it retains a record of all run activity, including summaries, logs, a reference to the changes that caused the run, and user comments. (See also: Viewing and Managing Runs.)

## Terraform Runs

For workspaces with remote operations enabled (the default), Terraform Cloud performs Terraform runs on its own disposable virtual machines, using that workspace's configuration, variables, and state.

For more information, see Terraform Runs and Remote Operations.

## Listing and Filtering Workspaces

Terraform Cloud's top navigation bar includes a "Workspaces" link, which takes you to the list of workspaces in the current organization.

Screenshot: the list of workspaces

This list only includes workspaces where the current user account has permission to read runs. (More about permissions.)

If the list is large, you can use the filter tools at the top of the list to find the workspaces you're interested in.

The following filters are available:

Status filters: These filters sort workspaces by the status of their current run. There are four quick filter buttons that collect the most commonly used groups of statuses (success, error, needs attention, and running), and a custom filter button (with a funnel icon) where you can select any number of statuses from a menu.

When you choose a status filter, the list will only include workspaces whose current runs match the selected statuses. You can remove the status filter by clicking the "All" button, or by unchecking everything in the custom filter menu.

List order: The list order button is marked with two arrows, pointing up and down. You can choose to order the list by time or by name, in forward or reverse order.

Name filter: The search field at the far right of the filter bar lets you filter workspaces by name. If you enter a string in this field and press enter, only workspaces whose names contain that string will be shown.

The name filter can combine with a status filter, to narrow the list down further.

## Planning and Organizing Workspaces

We recommend that organizations break down large monolithic Terraform configurations into smaller ones, then assign each one to its own workspace and delegate permissions and responsibilities for them. Terraform Cloud can manage monolithic configurations just fine, but managing smaller infrastructure components like this is the best way to take full advantage of Terraform Cloud's governance and delegation features.

For example, the code that manages your production environment's infrastructure could be split into a networking configuration, the main application's configuration, and a monitoring configuration. After splitting the code, you would create "networking-prod", "app1-prod", "monitoring-prod" workspaces, and assign separate teams to manage them.

Much like splitting monolithic applications into smaller microservices, this enables teams to make changes in parallel. In addition, it makes it easier to re-use configurations to manage other environments of infrastructure ("app1-dev," etc.).

Why Policy as Code?
JAN 12 2018
|
ARMON DADGAR
HashiCorp advocates for "infrastructure as code" approaches to managing infrastructure. We have talked about it publicly and published about it in our Tao of HashiCorp. At HashiConf 2017, we announced Sentinel, a framework for "policy as code". The same coding practices that are applied to infrastructure can be very effective in enforcing and managing policies. Codifying policy removes the need for ticketing queues, without sacrificing enforcement.

Operators adopt tools like HashiCorp Terraform to provide a simple workflow for managing infrastructure. Users write configurations and run a few commands to test and apply changes. Organizations with governance requirements typically interrupt this workflow with ticketing queues to enforce policies.

What is Policy?
Policy is a nebulous term and can span many different categories:

Compliance Policies. These policies ensure compliance with external standards such as PCI-DSS, SOC, or GDPR. External industry working groups or government agencies establish and mandate these standards.
Security Policies. Security policies adopted internally protect data privacy and infrastructure integrity. For example, ensuring only certain applications run on public networks or expose specific ports to the Internet.
Operational Excellence. These policies prevent service outages or degradation. For example, a policy may mandate at least two service instances, or validation of new configurations.
Historically, most policies are defined and enforced the same way. Policy authors translate the business requirements into a Word document with specific rules that should be enforced. Enforcement of policy is based on a ticketing workflow, where tickets are filed against a compliance or security team. For each ticket, the policy document is used to verify the ticket which is either approved or denied.

This workflow is slow, error prone, and makes it difficult to scale either the number of policies or the number of tickets being reviewed. End to end automation is difficult since the ticketing workflow is asynchronous and slow, and the implementation is often different for each system.

## What is Policy as Code?

Our driving mission has been infrastructure as code, the idea that infrastructure can be codified and automated with tools like Terraform and Nomad. This approach allows configuration to be tested, peer reviewed, versioned, automated, and re-used much like application code. Applying this approach to policy seemed natural and brings the same benefits.

Treating policy as code requires a way to specify policies and a mechanism to enforce them. Traditionally, policies were defined in Word documents and enforced manually. Instead, Sentinel provides a simple policy-oriented language to write policies, and integrates with our tools like Terraform Enterprise and Nomad Enterprise to enforce them. Below is an example Sentinel policy that ensures staging is deployed to the "us-east-1" region, while production is deployed to "us-west-1":

```
import "tfplan"

valid_regions = {"production": "us-west-1", "staging": "us-east-1"}
env_region = valid_regions[tfplan.variables.env]

is_not_aws = func(type) {
	return type is not "aws"
}

// Check the provider alias region matches the environment region
validate_aws_region = func(provider) {
	return all provider.alias as a {
		a.config.region is env_region
	}
}

main = rule {
	all tfplan.config.providers as type, provider {
		is_not_aws(type) or validate_aws_region(provider)
	}
}
```
The goal of the language is to be simple to read and write by individuals with a limited background in programming. This motivated us to write a custom language rather than adopt a general purpose programming language.

## Testability

One of the other benefits of Sentinel is that it also has a full testing framework. Consider the previous example, we could write a test case to validate its correctness using simple json syntax:

```
"mock": {
    "tfplan": {
      "variables": {
        "env": "production"
      },
      "config": {
        "providers": {
            "aws": {
              "alias": [
                {"config": {"region": "us-west-1"}}
              ]
            }
        }
      }
    }
  },
 
  "test": {
      "main": true
  }
}
```
We can then use the Sentinel command line tool to check our policy:

```
$ sentinel test -verbose
PASS - staging.sentinel
  PASS - test/staging/pass_not_aws.json
    trace:
      TRUE - staging.sentinel:15:1 - Rule "main"
        TRUE - staging.sentinel:17:3 - is_not_aws(k)
  PASS - test/staging/pass.json
    trace:
      TRUE - staging.sentinel:15:1 - Rule "main"
        FALSE - staging.sentinel:17:3 - is_not_aws(k)
        TRUE - staging.sentinel:17:20 - validate_region(v)
  PASS - test/staging/fail_aws_invalid_region.json
    trace:
      FALSE - staging.sentinel:15:1 - Rule "main"
 FALSE - staging.sentinel:17:3 - is_not_aws(k)
        FALSE - staging.sentinel:17:20 - validate_region(v)
```

Using this approach we can construct multiple test cases for pass and fail scenarios, allowing us to easily validate our policy without having to execute it. This also allows us to change our policy and ensure regressions are not introduced.

## Executing Policy

Once written, the policy can be enforced automatically without manual review. This enforcement is best done in the change path, so that policy violations can be prevented rather than detected. Detecting policy violations requires a separate remediation workflow and is more cumbersome than preventing the problem entirely. Here is an example enforcement workflow with Terraform Enterprise:

This workflow decouples the policy definition and enforcement, keeping a fast feedback loop for operators. Using automation avoids the human error inherent to a manual review process, and allows a large number of policies or changes as well.

## Conclusion

Using a ticketing queue and manual review for policy enforcement can bottleneck changes. Policy as code uses codified policies and automated enforcement. This approach extends on infrastructure as code, which brought similar benefits. Sentinel is a framework for policy as code that we introduced and have integrated into Terraform Enterprise, Vault Enterprise, Nomad Enterprise, and Consul Enterprise. Avoiding a ticketing workflow allows organizations to provide more self-service capabilities and end-to-end automation, minimizing the friction for developers and operators.

HashiCorp Terraform Module Registry
SEP 19 2017
|
MITCHELL HASHIMOTO
We are excited to announce the availability of the HashiCorp Terraform Module Registry.

HashiCorp Terraform is a tool to safely and efficiently build, change, and version on-premises and cloud infrastructure using a consistent workflow. Terraform uses automate infrastructure management through the use of infrastructure as code. Terraform configurations can be composed with modules to encapsulate groups of resources in your infrastructure.

The HashiCorp Terraform Module Registry gives Terraform users easy access to templates for setting up and running their infrastructure with verified and community modules. This post shares the goals of the Terraform Module Registry, how to get started with the Terraform Module Registry as a module consumer and as a module contributor, and where to find more information.

The Terraform Module Registry is available at registry.terraform.io. The complete documentation for using the Module Registry can be found at https://www.terraform.io/docs/registry/index.html.

## Terraform Module Registry Goals

The Module Registry addresses key challenges for module producers and module consumers. For module producers, the registry is a central place to publish, version, and share modules. For module consumers, the registry is a central place to discover, use, and collaborate on modules. The Module Registry makes it easier for partners and community members to share and collaborate on modules and also to update and version modules to continuously make improvements to infrastructure configurations. Expert users can share their knowledge and beginners can get up and running on Terraform faster.

## Module Search

To address the challenge of finding modules, the Module Registry provides discovery through search and by surfacing popular modules.

## Module Registry Landing Page

There are two categories of modules available in the Module Registry: Verified modules and Community modules. Verified modules have undergone certification and compatibility testing by HashiCorp prior to being accepted and are maintained by trusted HashiCorp partners. Community modules can be contributed by any user, but have not been validated by HashiCorp directly.

Module Versioning, Details, and Usage
Selecting a particular module will display usage details including a code snippet you can copy and paste into your Terraform configuration to provision the specified infrastructure.

```
module "consul" {
		source = "hashicorp/consul/aws"
}
```

As modules change over time the registry will automatically track the versions released. Module versioning is unique to the Module Registry. This is nice if you want to continue to reuse a known version or upgrade to a latest version. For the initial release, Terraform supports pulling the latest version of a module. The next major version of Terraform will add full support for specifying version constraints. All modules published will be compatible once constraining versions is supported.

Each module also displays the details for inputs, outputs, and resources created. If a module depends on external modules, these are listed too.

## Using a Module from the Registry

Once you have found a module you want to use, you can copy the code in the Provision Instructions into your configuration to import it. If the module has any required variables, you will need to add those to the pasted code block. When viewing the module in the registry, you can view the list of required variables in the Inputs section. You can then complete the import process by running terraform init.

## Registry Download

The complete documentation for using the Module Registry can be found at https://www.terraform.io/docs/registry/index.html.

## Powered by Partners and the Community

The Module Registry provides a central place to publish modules. The cloud vendors and their communities contribute and maintain modules for the Module Registry. This model allows partners with the best expertise to provide reliable and quality modules for Alibaba Cloud, AWS, Google Cloud Platform, Microsoft Azure, and Oracle Cloud. The Module Registry is populated with an initial set of some of the most common infrastructure topologies used by customers. These initial services available today include example modules for compute, compute groups, core networking, databases, and load balancers. There are also modules contributed by CoreOS for Kubernetes and from Gruntwork, who built and maintain modules for HashiCorp Consul, Vault, and Nomad on AWS, Azure, and GCP.

You can read more about how HashiCorp and Google expand collaboration, easing secret and infrastructure management in Google's blog. Microsoft has also detailed their collaboration on Terraform and the Module Registry in their blog More and more fun with Terraform on Azure. There is also a blog from Oracle, Announcing Oracle Cloud Infrastructure Modules for the Terraform Module Registry.

In addition to the official partners, anyone in the Terraform community can publish modules directly from GitHub. To get started, sign in via GitHub and choose a repository. Module repositories must follow the guidelines for module creation.

## Registry Module Upload

Integration of the Module Registry with Terraform Enterprise
HashiCorp Terraform Enterprise will deliver a private version of the Module Registry in an upcoming release. This will allow organizations to safely share private modules with their internal teams. The integration of the Module Registry into Terraform Enterprise will allow organizations to standardize on expert modules across their user base. For more information on Terraform Enterprise, visit hashicorp.com/products/terraform

## Conclusion

Terraform provides organizations with infrastructure as code, cloud platform management, and the ability to create modules for self-service infrastructure. The Module Registry provides a new platform for sharing and reuse to empower individuals to quickly provision and manage their infrastructure with Terraform.

To get started with Terraform Module Registry, visit https://registry.terraform.io.

Learn more about Sentinel: https://www.hashicorp.com/sentinel.

https://www.terraform.io/docs/cloud/sentinel/index.html
https://www.terraform.io/docs/cloud/registry/index.html
https://www.terraform.io/docs/cloud/workspaces/index.html

https://www.hashicorp.com/blog/why-policy-as-code
https://www.hashicorp.com/blog/hashicorp-terraform-module-registry
https://www.hashicorp.com/resources/terraform-enterprise-understanding-workspaces-and-modules