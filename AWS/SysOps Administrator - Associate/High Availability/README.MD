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


Vertical Scaling this is used for more performance driven task.  A list below are a few examples as to way this would be need.  Also using this type of scaling to increase cost

* <b> Web Applications ( EC2 Machine )</b>
* <b> Database Usage ( RDS ) </b>
* <b> ECS Container Registry (EC2 Machines) </b> 

To mention that vertical scaling works as the table shows the following



Upscaling **t2.mirco ===================> m5.large**

Descaling **m5.large ===================> t2.mirco**


## Horizontal Scaling


Horizontal Scaling is different in the way it works around scaling resources in your aws accounts.  This works in a fashion of setup an nginx asg group with ec2 instances and what will happen is that base off proformance it will scale accross the same instances never increase tiers, but will still increase cost as this will be running 2 instances instead of one.  Below is a example of how it works.

Upscaling **t2.mirco ==================> t2.mirco**

Descaling **t2.mirco ==================> t2.mirco**

In the above tables you can see the upscaling and down scaling is always doing the same instance type i.e using a t2.micro in the asg. 

Also there is a terraform code in this repo which you can use.


## Launch Config


With the launch config you can set the <b>launch config</b> for the auto scaling is going to work.  Below there is a list of pros and cons to this and something to be aware for the exam.

* Can work with on demand or spot instances.
* Can attached a IAM role for added secuirty controls.
* Enable cloudwatch for montioring and logging.
* From the advance setting you can add user-data, ip address, RamDisk, KernalId.

Also there is a terraform use if you would like to try this.

With the predivce scaling this is based on ML which is take of time if this needs to scale best on peformance of what you are running.

Also below there different on how to use the auto scaling what it can be used for
* Auto Scale can been triggered by manual opertion.
* Auto Scale can been dymanic which agin depends on performance of cpu, memory 
* Auto scale can be schedule at times of most peak i.e in the morning when people are logging in.

In order for making sure that auto scaling and auto scal plans are working to how you want. You can use the following tool in order to see what happens when stress it been put on the system.

`stress test tool`

## Application Auto Scaling


With application auto scaling as is base around the following elements 

* spot fleets (EC2 Instances)
* dyno db ( Database )
* ecs containers ( EC2 Instances)

The above and based aws resources which can be used to do application auto scale and create auto scale plans also along with this you do you have ablilty with the cloudwatch logs to help the auto scale decide to scale it performance has been maxed out.

## AWS Auto Scaling


With the Auto Scaling this is designed for creating and maintain scale plans.  For use of this would a couple of thing to consider and they are list in points below

* Depencey for any autoscaling group, would be to use a lauch template and launch config
* <b>Spot fleet instance and ecs cannot not be discovered using tags</b>. 
* Provisoned option uses auto scaling and creat scaling plans.

If you spin the spot fleet up using a cloud formation then you would be able to use the auto scale policy

For use of the auto scaling, the default should be used which is target tracking.  With the step scaling is more advance steps for configuring your scale plan.

    Here is a table below of what can be used with this scale plan

    | Service                   | Auto Scale Plan |
    |---------------------------|-----------------|
    |  Dyno DB Nosql            | Yes             |
    |  EC2                      | Yes             |
    |  ECS Containers Registry  | Yes             |
    |  Aurora Replics           | Yes             |
    |  RDS Database             | Yes             |



*** 

* Auto scaling on demand feature is not availble.

* RDS autoscaling plan will create a read database which looks somethin like this.
`application-autoscaling-uid number`
* Muitiplue reads against the autoscaling read database that it creates.

Serverless mode of the auto scaling this would automanictly scale base on the capcity needs and change it when need.

## Load Balancer

Application
* Layer 7 load balancing HTTP / HTTPS
* Server Name Indication
* IP Address as targets
* Lamda Functions as targets
* Host / Path based routing
* Containerzied application support
* Sticky sessions support (Maintain client connection to the server)
* Secuirty user authentication and WAF
* cross zone load balancing
* Elastic load balancer is a regional service.

Example terraform code is the Load Balancer folder for view. To deploy the load balancer make sure the flag is set before running

<b> Application_Load_Balancer = true </b>


## Network Load Balancer

* Layer 4 TCP Traffic
* cross zone load balancing (but must be enabled)
* Supports Millions
* High Throughput / Low Latency
* Preserve Source IP
* Static / Elastic IP support

Example terraform code is the Load Balancer folder for view. 
To deploy the load balancer make sure the flag is set before running

<b> Network_Load_Balancer = true </b>

## Classic Load Balancer (Legancy)

* Legacy solution (EC2-Classic network)
* Not recommended for VPC
* High availability
* SSL Offloading
* Sticky sessions
* Layer 4 and Layer 7 load balancing

Example terraform code is the Load Balancer folder for view. To deploy the load balancer make sure the flag is set before running

<b> Classic_Load_Balancer = true </b>

## Usage of Terraform Code

Just for any one who will use the terraform code for studying.  The following need to be defined before you use the terraform code that i have provided your.

```
variable "vpc_id" {
  description = "This for your vpc id"
  type        = string
  default     = ""
}
```
```
variable "subnet1" {
  description = "This for your first subnet"
  type        = string
  default     = ""
}
```
```
variable "subnet2" {
  description = "This for your second subnet"
  type        = string
  default     = ""
}
```
```
variable "subnet3" {
  description = "This for your third subnet"
  type        = string
  default     = ""
}
```