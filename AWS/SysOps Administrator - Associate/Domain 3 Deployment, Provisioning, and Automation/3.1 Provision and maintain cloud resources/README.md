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
* Parameters: Username and or Password
* Mappings: Example key = Region, Value = us-west-2
* Conditions: Check if any environment has been deployed.
* Resources: i.e EC2 instances. S3 Bucket.
* Outputs: Security ids

### Example Deployment through cloud formation

[Cloudformation Deployment](Template)

### DependsOn Attribute Vs Wait Conditions

#### DependsOn
- Controls order of resource creation
- Does not wait for signal for success and failure.

#### Wait Condition
- Wait for success condition before moving to a the cloudformation template.

- [DependsOn](Template)
- [WaitCondition](Template)

### Cloudformation YAML Example.

```
YAML code
```

## Cloud Formation Stacks

### Nested Stacks
Stacks are create as part of another stack example below of how this is archived.

```
AWS::Cloudformation::Stacks **resource**
```

Diagram below help with the above.
[Nested Stacks](template)

Sharing values between stacks

```
Json Code
```
### Export Stacks Output Values
Export the output values
Import of values

## Comparing
### Nesting
- Used when stacks are in the same group

### Export Values
- When stacks are not apart of a group

## Troubleshooting Cloudformation
Most of the troubleshooting can be done from the console. Link below is to the AWS troubleshooting section for cloudformation.

[CloudFormation Troubleshooting]([https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html)


## Cloudformation StackSets

Diagram for the Cloudformation StackSets
[StackSets Diagram](Template)

### Permission of Stack
- Self managed
- Service - Managed

### Example Code Deploy StackSets
- [StackSets Deployment Terraform](Template)
- [StackSets Deployment aws cli](Template)

## Sharing Resources AWS Resources Access Manager
- Create share
- Assign Resources to the Share
- Use a Principal to access the resource.

Link below for further reading

[AWS Resources Manager](https://docs.aws.amazon.com/ram/latest/userguide/shareable.html)

### Example code AWS Resources Access Manager

- [AWS Resources Manager Terraform](Template)
- [AWS Resources Manager aws cli](Template)

## IAM with Cross Accounts Roles
- One Role for one or more accounts

## Example IAM with S3
- [Cross Accounts Terraform ](Template)
- [Cross Accounts aws cli ](Template)

## Deployment Types
### Blue / Green and Canary Deployments
Below is a diagram of a blue / green and canary deployment.

- [Blue / Green Diagram](Template)
- [Canary Diagram](Template)

#### Example Blue / Green and Canary Deployments
- [Blue / Green Terraform](Template) **1 Down 1 Up**
- [Canary Diagram aws cli](Template) **Traffic Split**

### Rolling
- [Rolling Diagram](Template)

#### Example Rolling Deployments
- [Rolling Terraform](Template) **Across may different hosts**
- [Rolling aws cli](Template) **Across may different hosts**

### In-Place
- [In-Place Diagram](Template) **Application update or in-place**

#### Example Rolling Deployments
- [In-Place Terraform](Template) **Application update or in-place**
- [In-Place aws cli](Template) **Application update or in-place**

## AWS Deployment

### Cloudformation
- IAC Scripts
- Template of a Json or Yaml
- Create stacks of resources
- Tear down the entire stack at once

### Elastic Beanstalk
- Web Application Service from AWS
- Supports Python .Net Java
- Upload source code and Beanstalk **manges** the infrastructure components.

### CodeDeploy
- Deploys and automates services like lamda EC2 and ECS
- Compute Resources should already exists.
- Is used with CodePipeline CodeStar and CodeBuild.

### Elastic Container Service
- Docker Images are supported
- Fargate and EC2 for underlay compute storage
- 
### Elastic Kubernetes Service
- Fully Managed Kubernetes stack in AWS
- EC2 or Fargate for underlaying compute power
- Cloudwatch, Autoscaling can be used.

### OpsWorks
- Configuration Manager to help with post config tasks.
- Support of Chef and Puppet.

## Troubleshooting

### Cloudformation
- Insufficient permissions for cloudformation
- Insufficient permissions for the AWS resource deploying
- Empty the S3 box before deleting any cloud formation stack.
- Missing delete permission for deleting cloudformation stacks.
- Termination Protection is enabled of the Stack.
- Service Limits and Max Out Quotes.
- Roll back fails as changes where made outside the stack **Desired State**
- Insufficient Permission for Role Back
- Limitations Error

### CodeDeploy
- Agent not running on EC2 instances
- IAM Profile not assigned
- Tags not applied correctly.

### OpsWorks
- Unable to manage Instance due to a dependency edit or deletion.
- Stuck on **Booting**, Check the VPC settings and networking to connect to the required services.
- Instance wont boot after chef run, Check the version of chef running.
