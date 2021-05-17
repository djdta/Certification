## 8h Describe built-in dependency management (order of execution based)

## Summary

In this tutorial, you will learn about dependencies between resources and modules. Most of the time, Terraform infers dependencies between resources based on the configuration given, so that resources are created and destroyed in the correct order. Occasionally, however, Terraform cannot infer dependencies between different parts of your infrastructure, and you will need to create an explicit dependency with the depends_on argument.

Manage implicit dependencies
The most common source of dependencies is an implicit dependency between two resources or modules.

Create a directory named learn-terraform-dependencies and paste this configuration into a file named main.tf.

```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "2.69.0"
    }
  }
}

provider aws {
  region = "us-west-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "example_a" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
}


resource "aws_instance" "example_b" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example_a.id
}
```
The aws_eip resource type allocates and associates an elastic IP to an EC2 instance. Since the instance must exist before the Elastic IP can be created and attached, Terraform must ensure that aws_instance.example_a is created before it creates aws_eip.ip. Meanwhile, aws_instance.example_b can be created in parallel to the other resources.

First, initialize this directory for use with Terraform.

```
$ terraform init
Next, apply the configuration.

```
$ terraform apply

Respond to the confirmation prompt with yes.

You can see the order Terraform provisions the resources in the output of the apply step. The output will look similar to the following.

aws_instance.example_a: Creating...
aws_instance.example_b: Creating...
aws_instance.example_a: Still creating... [10s elapsed]
aws_instance.example_b: Still creating... [10s elapsed]
# ...Output truncated
aws_instance.example_a: Still creating... [1m0s elapsed]
aws_instance.example_b: Still creating... [1m0s elapsed]
aws_instance.example_b: Creation complete after 1m1s [id=i-0c31f0e4fb17a10e8]
aws_instance.example_a: Creation complete after 1m1s [id=i-0f3b463f3b79b7206]
aws_eip.ip: Creating...
aws_eip.ip: Still creating... [10s elapsed]
aws_eip.ip: Creation complete after 16s [id=eipalloc-04b1282f16b6fb068]
```
As shown above, Terraform waited until the creation of EC2 instance example_a was complete before creating the Elastic IP address.

Terraform automatically infers when one resource depends on another by studying the resource attributes used in interpolation expressions. In the example above, the reference to aws_instance.example_a.id in the definition of the aws_eip.ip block creates an implicit dependency.

Terraform uses this dependency information to determine the correct order in which to create the different resources. To do so, it creates a dependency graph of all of the resources defined by the configuration. In the example above, Terraform knows that the EC2 Instance must be created before the Elastic IP.

https://learn.hashicorp.com/tutorials/terraform/dependencies