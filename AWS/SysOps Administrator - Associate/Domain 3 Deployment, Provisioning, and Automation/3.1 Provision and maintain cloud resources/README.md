# 3.1 Provision and maintain cloud resources

## AMI Builders and EC2 Builder

### AMI (Amazon Machine Image)
- OS installed
- Pre installed Software installed
- Short launching Times
- Repeatable

### EC2 Builder
This is a managed service from AWS which allows the making of images on there platform
- Image pipeline to build and maintain images.
- Image Recipe is a document that defines the source image and changes to get to the desired image.

### Example EC2 Builder Image pipeline code
- [EC2 Builder Image pipeline Terraform ](Template)
- [EC2 Builder Image pipeline AWS Cli ](Template)

### Example EC2 Builder Image
- [EC2 Builder Terraform ](Template)
- [EC2 Builder AWS Cli ](Template)

## Managing and Deleting Images.
In order

- Image pipeline
- Image Recipe
- All the remaining resources that was used.

## Cloudformation
Some terms you my seen through the use of using cloudformation.

### Stack
- Collection of resource that are together as a group.
### Template
- A JSON or YAML file to describe a stack
### Change Sets
- Preview how proposed changes will impact resources.
### Stack Sets
- Creates, Updates and deletes stack across multiple regions and accounts
### Nested Stacks
- Stacks created as part of other stacks.

## Cloudformation Template
Here below is a example of a cloudformation template.

### Cloudformation JSON Example

```
JSON code
```
* Parameters
* Mappings
* Conditions
* Resources
* Outputs


### Cloudformation YAML Example.

```
YAML code
```