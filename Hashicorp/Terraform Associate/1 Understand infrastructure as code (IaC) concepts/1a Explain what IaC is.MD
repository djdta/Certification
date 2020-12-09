# Infrastructure as Code

#### <ins>Introduction</ins>

Infrastructure­ as ­Code (IaC) is a type of IT infrastructure that operations teams can automatically manage and provision through code, rather than using a manual process. Infrastructure­ as ­Code is sometimes referred to as <ins><b>programmable infrastructure</ins></b>

---


| Documentation | Tutorial
| --------------- | -------------- |
|[Infrastructure as code](https://www.terraform.io/intro/index.html#infrastructure-as-code) | [Introduction to Infrastructure as Code with Terraform](https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code) 
|[Infrastructure as Code in a Private or Public Cloud](https://www.hashicorp.com/blog/infrastructure-as-code-in-a-private-or-public-cloud)




Infrastructure as Code
Infrastructure is described using a high-level configuration syntax. This allows a blueprint of your datacenter to be versioned and treated as you would any other code. Additionally, infrastructure can be shared and re-used.


It really starts by looking at: 

How is infrastructure traditionally managed?

We look at traditional infrastructure, say VMware, running inside of a private data center. The classic approach was: If I'm a consumer of infrastructure, I would file a ticket, and then someone on the other end of this ticketing queue is pulling it off, logging it into a management portal or an administrative console, and pointing and clicking to provision that piece of infrastructure.

This was okay if I didn't have to manage a lot of infrastructure. Or if the churn of my infrastructure was relatively minimal. And this was true for many private data centers. A VM would live for months to years, there was a relatively limited scale of deployment, and so it was possible to manually point and click and administer these systems.

Now, as we're making a transition, we're saying there are a few key changes:

* One: We're going to a cloud environment, which is <ins><b>predominantly API-driven</ins></b>. That's one big change.

* Second change is: There's a much higher <ins><b>elasticity of infrastructure</ins></b>, where instead of months to years, it's now days to weeks in terms of how long a resource might live.

The scale of infrastructure is much, much higher, because instead of a handful of large instances, we might have many smaller instances, so there are many more things we need to provision, and this infrastructure tends to be cyclic. We might <ins><b>scale up to handle a load during a peak day, and then scale down at night to save on cost</ins></b>, because it's not a fixed cost. Unlike owning hardware that we can depreciate, we're now paying by the hour. So, it makes sense to only use the infrastructure you need, and you have to have this <ins><b>elasticity</ins></b>.

So as you start making these changes, all of a sudden. The thought of, "I'm going to file a thousand tickets every morning to spin up to our peak capacity and then file another thousand tickets at night to spin back down, and then manually manage all of this," clearly starts to become challenging—in terms of: How do we begin to operationalize this in a way that's reliable and robust, and not prone to human error?

There's a change, in terms of the dynamism of our infrastructure. So the real idea behind infrastructure as code is: <ins><b>How do we take the process—in some sense, the things that we were pointing and clicking to achieve—how do we take that and capture that in a codified way?</ins></b> So if I need to do it one time, ten times, or a thousand times, I can automate that. Every morning, I can hit a script that brings up a thousand machines, and every evening, hit the same script to bring it back down to whatever our evening size is.

I can begin to both automate that, but also now that I've captured it as a codified form, I can check it into version control and I get versioning. Now I can see an incremental history of who changed what, how is my infrastructure actually defined at any given point of time, and I have this transparency of documentation that I lack in a traditional point-and-click environment. It's really an oral tradition in terms of: What is the configuration? What are the things that you need to point and click and set up?

That really becomes the value. It's really the versioning of it, the <ins><b>reusability of the code</ins></b>, and the ability to then do automation on top of it.

## Other Resources

| Index |
|:----------:|
|[Infrastructure as code](https://en.wikipedia.org/w/index.php?title=Infrastructure_as_code&oldid=903249795)
|[Infrastructure As Code Best Practices](https://stackify.com/what-is-infrastructure-as-code-how-it-works-best-practices-tutorials/)|
|[Hashicorp Learning](https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code)|
|[Amazon Whitepaper](https://www.amazon.co.uk/Infrastructure-as-Code-AWS-Whitepapers-ebook/dp/B074GGM4LK/ref=sr_1_17?crid=2O9RHCXFE7WEK&dchild=1&keywords=infrastructure+as+code&qid=1607365996&sprefix=Infras%2Caps%2C153&sr=8-17)|