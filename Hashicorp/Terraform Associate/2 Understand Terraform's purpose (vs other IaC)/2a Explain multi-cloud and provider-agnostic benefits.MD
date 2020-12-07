## Template Change
TODO: #1 Change the Name to reflect this sections

#### Infrastructure as Code in a Private or Public Cloud

LARRY EICHENBAUM, AHMED BELGANA
As technology advances, our tools change. But because most people resist change it often takes some type of failure—a system outage, a failed disaster recovery event, etc.—to get us to change our governance practices.

For example, as companies move their operations to the cloud they tend to manage their cloud infrastructure the same way they managed their on-premise physical hardware, by logging into their virtual infrastructure’s web interface, or directly onto a system and applying changes via GUI or CLI. These users haven’t adopted the use of infrastructure as code (IaC) through the use of tools like HashiCorp Terraform.

What is IaC? It is infrastructure <ins><b>(CPUs, memory, disk, firewalls, etc.)</ins></b> defined as code within definition files. But why change how we define and build infrastructure?

Virtual compute enabled us to build and apply configuration changes to infrastructure via software commands. While these commands were often scripted, they were still hard for humans to read. More modern tools accepted code that was both human and machine readable, and provided additional benefits. They simplified code testing, could apply and track the changes between iterations, and most importantly they enabled teams to reuse components (e.g. modules) of code across different projects. It’s no wonder that IaC has developed such a significant following and adoption.
