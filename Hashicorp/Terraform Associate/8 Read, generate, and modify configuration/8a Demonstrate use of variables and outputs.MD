# 8a Demonstrate use of variables and outputs

## Summary

Here below is example of variables been used in terraform.

Let's first extract our region into a variable. Create another file variables.tf with the following contents.

Note: The file can be named anything, since Terraform loads all files in the directory ending in .tf.

```
variable "region" {
  default = "us-west-2"
}
```

Copy
This defines the region variable within your Terraform configuration. There is a default value which makes it optional. If no default is set, the variable is required and must be set using one of the techniques mentioned in this tutorial.

## Using Variables in a Configuration

Next, set the region in the AWS provider configuration using the variable you declared.

```
provider "aws" {
- region = "us-west-2"
+ region = var.region
}
```
This uses the variable named region, prefixed with var.. It tells Terraform that you're accessing a variable and that the value of the region variable should be used here. It configures the AWS provider with the given variable.

## Assigning variables

There are multiple ways to assign variables. The order below is also the order in which variable values are chosen.

## Command-line flags

You can set variables directly on the command-line with the -var flag. Any command in Terraform that inspects the configuration accepts this flag, such as apply, plan, and refresh.

```
$ terraform apply \
  -var 'region=us-west-2'
```

Once again, setting variables this way will not save them, and they'll have to be entered repeatedly as commands are executed.

## From a file

To persist variable values, create a file and assign variables within this file. Create a file named terraform.tfvars with the following contents:

```
region = "us-west-2"
```

Terraform automatically loads all files in the current directory with the exact name of terraform.tfvars or any variation of *.auto.tfvars. If the file is named something else, you can use the -var-file flag to specify a file name. These files use the same syntax as Terraform configuration files (HCL). And like Terraform configuration files, these files can also be JSON.

We don't recommend saving usernames and passwords to version control. You can create a local file with a name like secret.tfvars and use -var-file flag to load it.

You can use multiple -var-file arguments in a single command, with some checked in to version control and others not checked in.

```
$ terraform apply \
  -var-file="secret.tfvars" \
  -var-file="production.tfvars"
```

Tip: This is one way to provision infrastructure in a staging environment or a production environment using the same Terraform configuration.

## From environment variables

Terraform will read environment variables in the form of TF_VAR_name to find the value for a variable. For example, the TF_VAR_region variable can be set in the shell to set the region variable in Terraform.

Note: Environment variables can only populate string-type variables. List and map type variables must be populated via one of the other mechanisms.

## UI input

If you execute terraform apply with any variable unspecified, Terraform will ask you to input the values interactively. These values are not saved, but this provides a convenient workflow when getting started with Terraform. UI input is not recommended for everyday use of Terraform.

Note: In Terraform versions 0.11 and earlier, UI input is only supported for string variables. List and map variables must be populated via one of the other mechanisms. Terraform 0.12 introduces the ability to populate complex variable types from the UI prompt.

## Variable defaults

If no value is assigned to a variable via any of these methods and the variable has a default key in its declaration, that value will be used for the variable.

Rich data types
Strings and numbers are the most commonly used variables, but lists (arrays) and maps (hashtables or dictionaries) can also be used.

»Lists
Lists are defined either explicitly or implicitly.

# Declare implicitly by using brackets []

```
variable "cidrs" { default = [] }
```

# Declare explicitly with 'list'

```
variable "cidrs" { type = list }
```

You can specify list values in a terraform.tfvars file.

```
cidrs = [ "10.0.0.0/16", "10.1.0.0/16" ]
```

## Maps

A map is a key/value data structure that can contain other keys and values.

We've replaced our sensitive strings with variables, but we are still hard-coding AMIs. Unfortunately, AMIs are specific to the geographical region in use. One option is to ask the user to input the proper AMI for the region, but Terraform can do better than that with a map.

Maps are a way to create variables that are lookup tables. Let's extract our AMIs into a map and add support for the us-east-1 region.

```
variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-fc0b939c"
  }
}
```
A variable can be explicitly declared as a map type, or it can be implicitly created by specifying a default value that is a map. The above demonstrates both an explicit type = "map" and an implicit default = {}.

To use the amis map, edit aws_instance to use var.amis keyed by var.region.

```
resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
}
```
The square-bracket index notation used here is an example of how the map type expression is accessed as a variable, with [var.region] referencing the var.amis declaration for dynamic lookup.

For a static value lookup, the region could be hard-coded such as var.amis["us-west-2"].

## Assigning maps

Map values can also be set using the -var and -var-file values.

```
$ terraform apply -var 'amis={ us-east-1 = "foo", us-west-2 = "bar" }'
```

Note: Even if a map's data is set in a tfvar file, the variable must be declared separately with either type="map" or default={}.

Here is an example of setting a map's keys from a file. This is the variable definition in example.tf.

```
variable "region" {}
variable "amis" {
  type = "map"
}
```
You can specify keys in a terraform.tfvars file.

```
amis = {
  "us-east-1" = "ami-abc123"
  "us-west-2" = "ami-def456"
}
```
Create an aws_instance with the amis and region.

```
resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
}
```
Read the selected AMI attribute from the aws_instance resource.

```
output "ami" {
  value = aws_instance.example.ami
}
```
Provision it by providing a region on the command line.

```
$ terraform apply -var region=us-west-2

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

  ami = ami-def456
```

https://learn.hashicorp.com/tutorials/terraform/aws-variables
https://learn.hashicorp.com/tutorials/terraform/aws-outputs