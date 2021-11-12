# Domain 2 Reliability and Business Continuity notes

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

## Launch Templates
- Recommended over launched templates.
- Version control templates.
- More advance options.
- Allow mixing class and instance types.

## EC2 Auto Scaling Groups
- Right Sizing Capacity needs.
- Logical collections of instances.
- Use of AZ
- Health checks can be performed on instances.

#### Terraform Code Examples: 
[Terraform Code](https://github.com/djdta/Certification/tree/main/AWS/SysOps%20Administrator%20-%20Associate/Domain%202%20Reliability%20and%20Business%20Continuity/Auto%20Scale/EC2)

#### AWS Cli Examples
[AWS Cli Code](Template)

## Autoscaling Polices
The use of having autoscale polices is to do manually adjusts the minimum, maximum or the desired capacity values.  It also automatically adjust base on *** metrics *** think cloudwatch :) 

- Target Tracking will auto scaling you target values. 
- Simple Auto scaling acts on cloudwatch *** alarms *** think cloudwatch :) 
-  Step Scaling Auto scaling acts based on banded values ranges.

Example IAC for Autoscaling Polices
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

#### AWS Cli Examples
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

#### Terraform Code Examples
[Autoscaling Plans Terraform](Template)

#### AWS Cli Examples
[Autoscaling Plans AWS Cli](Template)

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

#### AWS Cli Examples
- [RDS Deployment AWS Cli](Template)
- [Amazon Aurora Deployment Terraform](Template)