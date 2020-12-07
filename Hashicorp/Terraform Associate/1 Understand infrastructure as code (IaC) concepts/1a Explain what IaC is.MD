https://en.wikipedia.org/w/index.php?title=Infrastructure_as_code&oldid=903249795

https://stackify.com/what-is-infrastructure-as-code-how-it-works-best-practices-tutorials/

It really starts by looking at: How is infrastructure traditionally managed?

We look at traditional infrastructure, say VMware, running inside of a private data center. The classic approach was: If I'm a consumer of infrastructure, I would file a ticket, and then someone on the other end of this ticketing queue is pulling it off, logging it into a management portal or an administrative console, and pointing and clicking to provision that piece of infrastructure.

This was okay if I didn't have to manage a lot of infrastructure. Or if the churn of my infrastructure was relatively minimal. And this was true for many private data centers. A VM would live for months to years, there was a relatively limited scale of deployment, and so it was possible to manually point and click and administer these systems.

Now, as we're making a transition, we're saying there are a few key changes:

One: We're going to a cloud environment, which is predominantly API-driven. That's one big change.
The second change is: There's a much higher elasticity of infrastructure, where instead of months to years, it's now days to weeks in terms of how long a resource might live.
The scale of infrastructure is much, much higher, because instead of a handful of large instances, we might have many smaller instances, so there are many more things we need to provision, and this infrastructure tends to be cyclic. We might scale up to handle a load during a peak day, and then scale down at night to save on cost, because it's not a fixed cost. Unlike owning hardware that we can depreciate, we're now paying by the hour. So, it makes sense to only use the infrastructure you need, and you have to have this elasticity.

So as you start making these changes, all of a sudden. The thought of, "I'm going to file a thousand tickets every morning to spin up to our peak capacity and then file another thousand tickets at night to spin back down, and then manually manage all of this," clearly starts to become challenging—in terms of: How do we begin to operationalize this in a way that's reliable and robust, and not prone to human error?

There's a change, in terms of the dynamism of our infrastructure. So the real idea behind infrastructure as code is: How do we take the process—in some sense, the things that we were pointing and clicking to achieve—how do we take that and capture that in a codified way? So if I need to do it one time, ten times, or a thousand times, I can automate that. Every morning, I can hit a script that brings up a thousand machines, and every evening, hit the same script to bring it back down to whatever our evening size is.

I can begin to both automate that, but also now that I've captured it as a codified form, I can check it into version control and I get versioning. Now I can see an incremental history of who changed what, how is my infrastructure actually defined at any given point of time, and I have this transparency of documentation that I lack in a traditional point-and-click environment. It's really an oral tradition in terms of: What is the configuration? What are the things that you need to point and click and set up?

That really becomes the value. It's really the versioning of it, the reusability of the code, and the ability to then do automation on top of it.

Infrastructure as Code in a Private or Public Cloud
JAN 23 2020
|
LARRY EICHENBAUM, AHMED BELGANA
As technology advances, our tools change. But because most people resist change it often takes some type of failure—a system outage, a failed disaster recovery event, etc.—to get us to change our governance practices.

For example, as companies move their operations to the cloud they tend to manage their cloud infrastructure the same way they managed their on-premise physical hardware, by logging into their virtual infrastructure’s web interface, or directly onto a system and applying changes via GUI or CLI. These users haven’t adopted the use of infrastructure as code (IaC) through the use of tools like HashiCorp Terraform.

What is IaC? It is infrastructure (CPUs, memory, disk, firewalls, etc.) defined as code within definition files. But why change how we define and build infrastructure?

Virtual compute enabled us to build and apply configuration changes to infrastructure via software commands. While these commands were often scripted, they were still hard for humans to read. More modern tools accepted code that was both human and machine readable, and provided additional benefits. They simplified code testing, could apply and track the changes between iterations, and most importantly they enabled teams to reuse components (e.g. modules) of code across different projects. It’s no wonder that IaC has developed such a significant following and adoption.



IaC and the Infrastructure Lifecycle
So how does IaC fit into the infrastructure lifecycle? IaC can be applied throughout the lifecycle, both on the initial build, as well as throughout the life of the infrastructure. Commonly, these are referred to as Day 0 and Day 1 activities. “Day 0” code provisions and configures your initial infrastructure.

If your infrastructure never changes after the initial build (no OS updates, no patches, no app configurations, etc.) then you may not need tools that support subsequent updates, changes, and expansions. “Day 1” refers to OS and application configurations you apply after you’ve initially built your infrastructure.

IaC makes it easy to provision and apply infrastructure configurations, saving time. It standardizes workflows across different infrastructure providers (e.g., VMware, AWS, Azure, GCP, etc.) by using a common syntax across all of them.

IaC makes it easy to understand the intent of infrastructure changes, because it can span multiple files, allowing human operators to organize the code based on the intent. For example, an operator could create different files to define different infrastructure components, or separate variables definitions from execution blocks without affecting the execution.

Here is an example of code that the IaC tool Terraform would use to provision an Amazon VPC. Notice that the code is both human and machine readable.

resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
}
Tools like Terraform often include libraries of providers and modules to make it easy to write the code to provision and apply configurations. With Terraform, especially when the need is Day 0 only, it is common to apply initial configurations like the ones below which install and start a web server:

provisioner "remote-exec" {
  inline = [
    "sudo apt-get -y update",
    "sudo apt-get -y install nginx",
    "sudo service nginx start"
    ]
}
If it is necessary to apply Day 1 through Day N configurations, the code might leverage a tool like Chef, Ansible, Docker, etc.

provider "chef" {
  server_url = "https://api.chef.io/organization/example"
  run_list = [ "recipe[example]" ]
}
You can find a more complex example of Terraform IaC that provisions a two-tier application in AWS here.

IaC Makes Infrastructure More Reliable
IaC makes changes idempotent, consistent, repeatable, and predictable. Without IaC, scaling up infrastructure to meet increased demand may require an operator to remotely connect to each machine and then manually provision and configure many servers by executing a series of commands/scripts. They might open multiple sessions and move between screens, which often results in skipped steps or slight variations between how work is completed, necessitating rollbacks. Perhaps a command was run incorrectly on one instance and reverted before being re-run correctly.

These process inconsistencies can result in slight differences between servers that compound over time and could impact their performance, usability, or security. If a large team is applying changes, the risks increase because individuals don’t always follow the same instructions identically.

With IaC, we can test the code and review the results before the code is applied to our target environments. Should a result not align to our expectations, we iterate on the code until the results pass our tests and align to our expectations. Following this pattern allows for the outcome to be predicted before the code is applied to a production environment. Once ready for use, we can then apply that code via automation, at scale, ensuring consistency and repeatability in how it is applied.

Since code is checked into version control systems such as GitHub, GitLab, BitBucket, etc., it is possible to review how the infrastructure evolves over time. The idempotent characteristic provided by IaC tools ensures that, even if the same code is applied multiple times, the result remains the same.

IaC Makes Infrastructure More Manageable
Leveraging HashiCorp Terraform IaC provides benefits that enable mutation, when necessary, via code. Consider an environment has been provisioned that contains a couple servers and a load balancer. To address increased load, additional servers are needed. The IaC can be revised, with minimal changes, to bring new servers online using the previously defined configuration.

During execution, Terraform will examine the state of the currently running infrastructure, determine what differences exist between the current state and the revised desired state, and indicate the necessary changes that must be applied. When approved to proceed, only the necessary changes will be applied, leaving existing, valid infrastructure untouched.

IaC Makes Sense
Successfully managing the lifecycle of infrastructure is hard, and the impact of poor management decisions can be significant, ranging from financial and reputational losses to even loss of life when considering government and military dependencies on infrastructure. Adopting the use of an IaC tool such as HashiCorp Terraform, in conjunction with related and established tools, processes, and workflows, is a necessary step in mitigating these risks.

To learn more about Terraform and HashiCorp’s other infrastructure tools, visit the Terraform documentation and check out our learning tracks on HashiCorp Learn.