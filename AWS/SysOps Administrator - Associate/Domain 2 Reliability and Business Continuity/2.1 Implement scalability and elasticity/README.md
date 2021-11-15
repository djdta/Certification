# 2.1 Implement scalability and elasticity

*** Requirements ***
For use of the code example please make sure you following the link below

[Requirements](https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/certification-associate-tutorials)

## Capacity Planning
- Expectation
- Too Much capacity
- Not enough capacity
- Auto Scaling

## Horizontal scaling / Vertical Scaling
- Horizontal scaling (Scaling out) i.e having more of the same tier.
- Vertical Scaling (Scaling Up) i.e Increasing the tier for more performance.

### Vertical Scaling
Vertical Scaling this is used for more performance driven task.  A list below are a few examples as to way this would be need.  Also using this type of scaling to increase cost

* <b> Web Applications ( EC2 Machine )</b>
* <b> Database Usage ( RDS ) </b>
* <b> ECS Container Registry (EC2 Machines) </b> 

To mention that vertical scaling works as the table shows the following

Upscaling **t2.mirco ===================> m5.large**

Descaling **m5.large ===================> t2.mirco**

## Horizontal Scaling
Horizontal Scaling is different in the way it works around scaling resources in your aws accounts.  This works in a fashion of setup an nginx asg group with ec2 instances and what will happen is that base off proformance it will scale accross the same instances never increase tiers, but will still increase cost as this will be running 2 instances instead of one.  Below is a example of how it works.

Upscaling **t2.micro ==================> t2.micro**

Descaling **t2.micro ==================> t2.micro**


## Launch Templates
- Recommended over launched templates.
- Version control templates.
- More advance options.
- Allow mixing class and instance types.
- Can work with on demand or spot instances.
- Can attached a IAM role for added security controls.
- Enable cloudwatch for monitoring and logging.
- From the advance setting you can add user-data, ip address, RamDisk, KernalId.

## EC2 Auto Scaling Groups
- Right Sizing Capacity needs.
- Logical collections of instances.
- Use of AZ
- Health checks can be performed on instances.
- Auto Scale can been triggered by manual operation.
- Auto Scale can been dynamic which agin depends on performance of cpu, memory
- Auto scale can be schedule at times of most peak i.e in the morning when people are logging in.

#### Code Examples: 
- [Terraform Code](https://github.com/djdta/Certification/tree/main/AWS/SysOps%20Administrator%20-%20Associate/Domain%202%20Reliability%20and%20Business%20Continuity/Auto%20Scale/EC2)
- [AWS Cli Code](Template)

`stress test tool`

## Autoscaling Polices
The use of having autoscale polices is to do manually adjusts the minimum, maximum or the desired capacity values.  It also automatically adjust base on **metrics** think cloudwatch :) 

- Target Tracking will auto scaling you target values. 
- Simple Auto scaling acts on cloudwatch **alarms** think cloudwatch :) 
-  Step Scaling Auto scaling acts based on banded values ranges.

#### Code Examples: 
[Terraform Code](Template)
[AWS Cli Code](Template)

## Dynamic Scaling with Schedules

- Fixed value for minimum, maximum and desired capacity.
- One Time or Recurring
- Cron expressions for recurrence pattern
- Time and Dates can be used.

### Example Scaling polices:

#### Terraform Code Examples
- [Target Tracking Code Terraform](Template)
- [Simple Code Terraform](Template)
- [Step Scaling Terraform](Template)
- [Schedule Action Terraform code](Template)
- [Target Tracking Code AWS Cli](Template)
- [Simple Code AWS Cli](Template)
- [Step Scaling AWS Cli](Template)
- [Schedule Action AWS Cli](Template)

## AWS Autoscaling Plans
With autoscaling plans there are many features that this can be used, here below are some of the features.

  - EC2 Services, EC2 spot fleets and Aurora Replicas
  - Automatic scaling of resources for applications running in aws.
  - Can use a specified cloud formation stack in aws.
  - Discover scalable resource with the use of tags.
  - Can use one or more EC2 autoscaling groups.
  - Dynamic and Predicted scaling options.

 ### Example Autoscaling Plans:

#### Code Examples
- [Autoscaling Plans Terraform](Template)
- [Autoscaling Plans AWS Cli](Template)

## Scaling RDS Deployment
Things  to consider when doing this and for the exam are the following bullet points:

- Scale Up by changing instance class.
- Storage for IOPS.
- Adding read Replicas for performance.
- Increase in performance for read operations. 

### Example RDS Deployment

#### Terraform Code Examples
- [ RDS Deployment Terraform](https://github.com/djdta/Certification/tree/aws-updates/AWS/SysOps%20Administrator%20-%20Associate/Domain%202%20Reliability%20and%20Business%20Continuity/2.1%20Implement%20scalability%20and%20elasticity/Auto%20Scale/Aurora%20rds)
- [Amazon Aurora Deployment Terraform](https://github.com/djdta/Certification/tree/aws-updates/AWS/SysOps%20Administrator%20-%20Associate/Domain%202%20Reliability%20and%20Business%20Continuity/2.1%20Implement%20scalability%20and%20elasticity/Auto%20Scale/Aurora%20rds)
- [RDS Deployment AWS Cli](Template)
- [Amazon Aurora Deployment Terraform](Template)

## AWS Caching Services
The caching service has been designed for performance with the following features.

- Temporary storage for frequently accessed data.
- Application that require less processing power.
- Lower costs by requiring a smaller sizes

These features can be used with the following AWS services Cloudfront, Redis Elasticache and DynamoDB Accelerator DX

### Cloudfront
- Caches static and dynamic content for web applications.
- Content Delivery Network with multi tier cache options.
- Over 200 Edge locations for hosting
- Servers Web Application quick was low latency.

Example of a cloudfront use case.

![Cloudfront Use Case](/AWS/.assets/Cloudfront.png)

#### Example Code
[Cloudfront Deployment Terraform ](Template)
[Cloudfront Deployment AWS Cli ](Template)

## Amazon DynamoDB Accelerator DAX
The feature of the caching services are as follows:

- Caching Layers to avoid duplication of real requests.
- In Memory Cached Managed.
- DAX **Amazon DynamoDB Accelerator** should be used in front of your DynamoDB table.

#### Example Code
[Amazon DynamoDB Accelerator DAX Deployment Terraform ]()
[Amazon DynamoDB Accelerator DAX Deployment AWS Cli ]()

## Amazon Elasticache
This is a manged service for amazon which provides managed service cached for your web applications and Database.  This service is a combination of memcached and redis combined.

- AWS Managed Cached service and all versions of redis and memcached.
- Memcached Fast multi threaded and designed for simplicity.
- Redis Supports snapshots replications and transactions.

Example of a Elasticache use case.

![Elasticache Use Case](/AWS/.assets/Elasticache.png)

### Example Code Memcached

[Elasticache Deployment Terraform ](Template)
[Elasticache Deployment AWS Cli ](Template)

### Example Code Redis
[Redis Deployment Terraform ](Template)
[Redis Deployment AWS Cli ](Template)