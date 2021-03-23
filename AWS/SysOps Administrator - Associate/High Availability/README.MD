# High Availability Objective

### Summary
For High Availiablity auto scaling are used for different resources from ec2 machine, rds, and ecs containers.  With the following sections we talk about why high availiabilty is a critical to any resources that supports auto scaling.  With this there is some consideration around the cost and how the scaling plan and policies.  In the following study guide the sections:

* Health monitoring

* Auto healing

* High Availability

* Intelligent scaling

* Vertical Scaling

* Horizontal Scaling

* Launch Config

* AWS Auto Scaling

* Application Auto Scaling

### Vertical Scaling
---

Vertical Scaling this is used for more performance driven task.  A list below are a few examples as to way this would be need.  Also using this type of scaling to increase cost

* <b> Web Applications ( EC2 Machine )</b>
* <b> Database Usage ( RDS ) </b>
* <b> ECS Container Registry (EC2 Machines) </b> 

To mention that vertical scaling works as the table shows the following

Upscaling

| EC2 Instances  | EC2 Instances Tier |
| :------------- | :----------:       |
|  t2.mirco      | m5.large           |


Descaling

| EC2 Instances  | EC2 Instances Tier |
| :------------- | :----------------: |
|  m5.large      | t2.mirco           |



## Horizontal Scaling
---

Horizontal Scaling is different in the way it works around scaling resources in your aws accounts.  This works in a fashion of setup an nginx asg group with ec2 instances and what will happen is that base off proformance it will scale accross the same instances never increase tiers, but will still increase cost as this will be running 2 instances instead of one.  Below is a example of how it works.

Upscaling

| EC2 Instances  | EC2 Instances Tier |
| :------------- | :----------:       |
|  t2.mirco      | t2.mirco           |

Descaling

| EC2 Instances  | EC2 Instances Tier |
| :------------- | :----------------: |
|  t2.mirco      | t2.mirco           |

In the above tables you can see the upscaling and down scaling is always doing the same instance type i.e using a t2.micro in the asg. Also there is a terraform code in this repo which you can use.


## Launch Config
---

* Can work with on demand or spot instances.
* Can attached a IAM role if you so wish.
* Enable cloudwatch for montioring.
* From the advance setting you can add userdata, ip address, RamDisk, KernalId.

ML used predtive scaling takes alook at the history
mamul
dymanic
sechdule
stress test

## Application Auto Scaling
---

* spot fleets
* dyno db
* ecs containers

## AWS Auto Scaling
---

This is a scaling plan

Depencey for any autoscaling group, would be to use a lauch template and launch config
Spot fleet instance and ecs cannot not be discovered using tags. If you spin the spot fleet up using a cloud formation then you would be able to use the auto scale policy

target trackling  default

step scaling more advance.

Auto Scaling with Dyno DB Nosql (tables) read and write, No VMs
on demand is not avaiable on demand.

Provisned uses auto scaling and creat scaling plans


Aurora Replics in Autoscaling
RDS can add auto scaling. After creating the autoscaling plan this will then create read database called application-autoscaling-uid number (muilit read)

serverless = autoscales automaticly once setup this is base on the capcity settings



