# 1b Advantages of Infrasturcutre as Code Patterns

| Documentation | Tutorial
| --------------- | -------------- |
|[Infrastructure as code Video](https://www.hashicorp.com/resources/what-is-infrastructure-as-code) | [Introduction to Infrastructure as Code with Terraform](https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code) 
|[Infrastructure as Code in a Private or Public Cloud](https://www.hashicorp.com/blog/infrastructure-as-code-in-a-private-or-public-cloud)

#### <ins>IaC and the Infrastructure Lifecycle</ins>

So how does IaC fit into the infrastructure lifecycle? IaC can be applied throughout the lifecycle, both on the initial build, as well as throughout the life of the infrastructure. Commonly, these are referred to as Day 0 and Day 1 activities. “Day 0” code provisions and configures your initial infrastructure.

If your infrastructure never changes after the initial build (no OS updates, no patches, no app configurations, etc.) then you may not need tools that support subsequent updates, changes, and expansions. “Day 1” refers to OS and application configurations you apply after you’ve initially built your infrastructure.

IaC makes it easy to provision and apply infrastructure configurations, saving time. It standardizes workflows across different infrastructure providers (e.g., VMware, AWS, Azure, GCP, etc.) by using a common syntax across all of them.

IaC makes it easy to understand the intent of infrastructure changes, because it can span multiple files, allowing human operators to organize the code based on the intent. For example, an operator could create different files to define different infrastructure components, or separate variables definitions from execution blocks without affecting the execution.

Here is an example of code that the IaC tool Terraform would use to provision an Amazon VPC. Notice that the code is both human and machine readable.

```
resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
}
```

Tools like Terraform often include libraries of providers and modules to make it easy to write the code to provision and apply configurations. With Terraform, especially when the need is Day 0 only, it is common to apply initial configurations like the ones below which install and start a web server:

```
provisioner "remote-exec" {
  inline = [
    "sudo apt-get -y update",
    "sudo apt-get -y install nginx",
    "sudo service nginx start"
    ]
}
```

If it is necessary to apply Day 1 through Day N configurations, the code might leverage a tool like Chef, Ansible, Docker, etc.

```
provider "chef" {
  server_url = "https://api.chef.io/organization/example"
  run_list = [ "recipe[example]" ]
}
```

#### <ins>IaC Makes Infrastructure More Reliable</ins>

IaC makes changes <ins><b>idempotent</ins></b>, <ins><b>consistent</ins></b>, <ins><b>repeatable</ins></b>, and <ins><b>predictable</ins></b>. Without IaC, scaling up infrastructure to meet increased demand may require an operator to remotely connect to each machine and then manually provision and configure many servers by executing a series of commands/scripts. They might open multiple sessions and move between screens, which often results in skipped steps or slight variations between how work is completed, necessitating rollbacks. Perhaps a command was run incorrectly on one instance and reverted before being re-run correctly.

These process inconsistencies can result in slight differences between servers that compound over time and could impact their performance, usability, or security. If a large team is applying changes, the risks increase because individuals don’t always follow the same instructions identically.

With IaC, we can <ins><b>test the code and review the results before the code is applied to our target environments</ins></b>. Should a result not align to our expectations, we iterate on the code until the results pass our tests and align to our expectations. Following this pattern allows for the outcome to be predicted before the code is applied to a production environment. Once ready for use, we can then apply that code via automation, at scale, ensuring consistency and repeatability in how it is applied.

Since code is checked into <ins><b>version control systems such as GitHub, GitLab, BitBucket, etc.</ins></b>, it is possible to review how the infrastructure evolves over time. The <ins><b>idempotent</ins></b> characteristic provided by IaC tools ensures that, even if the same code is applied multiple times, the result remains the same.

#### <ins>IaC Makes Infrastructure More Manageable</ins>
Leveraging HashiCorp Terraform IaC provides benefits that enable mutation, when necessary, via code. Consider an environment has been provisioned that contains a couple servers and a load balancer. To address increased load, additional servers are needed. The IaC can be revised, with minimal changes, to bring new servers online using the previously defined configuration.

During execution, Terraform will examine the state of the currently running infrastructure, determine what differences exist between the current state and the revised desired state, and indicate the necessary changes that must be applied. When approved to proceed, only the necessary changes will be applied, leaving existing, valid infrastructure untouched.

### <ins>IaC Makes Sense</ins>
Successfully managing the lifecycle of infrastructure is hard, and the impact of poor management decisions can be significant, ranging from financial and reputational losses to even loss of life when considering government and military dependencies on infrastructure. Adopting the use of an IaC tool such as HashiCorp Terraform, in conjunction with related and established tools, processes, and workflows, is a necessary step in mitigating these risks.

To learn more about Terraform and HashiCorp’s other infrastructure tools, visit the Terraform documentation and check out our learning tracks on HashiCorp Learn.

## Other Resources

| Index |
|:----------:|
|[Infrastructure as code](https://en.wikipedia.org/w/index.php?title=Infrastructure_as_code&oldid=903249795)
|[Infrastructure As Code Best Practices](https://stackify.com/what-is-infrastructure-as-code-how-it-works-best-practices-tutorials/)|
|[Hashicorp Learning](https://learn.hashicorp.com/)|