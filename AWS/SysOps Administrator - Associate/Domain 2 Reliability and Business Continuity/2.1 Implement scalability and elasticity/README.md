# Domain 2 Reliability and Business Continuity notes

*** Requirements ***
For use of the code example please make sure you have the following installed.

* Terraform installed on a linux box.
* AWS Cli
* AWS account (They are free to setup) ;)
* IAM Permission setup for terraform.  Link below to set this up.


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

### Terraform Code Examples: 
[Terraform Code](https://github.com/djdta/Certification/tree/main/AWS/SysOps%20Administrator%20-%20Associate/Domain%202%20Reliability%20and%20Business%20Continuity/Auto%20Scale/EC2)

### AWS Cli Examples
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

## Example Scaling polices:

### Terraform Code Examples
- [Target Tracking Code Terraform](Template)
- [Simple Code Terraform](Template)
- [Step Scaling Terraform](Template)
- [Schedule Action Terraform code](Template)

### AWS Cli Examples
- [Target Tracking Code AWS Cli](Template)
- [Simple Code AWS Cli](Template)
- [Step Scaling AWS Cli](Template)
- [Schedule Action AWS Cli](Template)
