# High Availability Objective

### Summary
For High Availability auto scaling are used for different resources from ec2 machine, rds, and ecs containers.  With the following sections we talk about why high availability is a critical to any resources that supports auto scaling.  With this there is some consideration around the cost and how the scaling plan and policies.  In the following study guide the sections:

* Health monitoring

* Auto healing

* High Availability

* Intelligent scaling

* Vertical Scaling

* Horizontal Scaling

* Launch Config

* AWS Auto Scaling

* Application Auto Scaling



## Launch Config


With the launch config you can set the <b>launch config</b> for the auto scaling is going to work.  Below there is a list of pros and cons to this and something to be aware for the exam.

Also there is a terraform use if you would like to try this.

With the predivce scaling this is based on ML which is take of time if this needs to scale best on peformance of what you are running.

Also below there different on how to use the auto scaling what it can be used for

In order for making sure that auto scaling and auto scal plans are working to how you want. You can use the following tool in order to see what happens when stress it been put on the system.



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

* Auto scaling on demand feature is not available.

* RDS autoscaling plan will create a read database which looks somethin like this.
`application-autoscaling-uid number`
* Muitiplue reads against the autoscaling read database that it creates.

Serverless mode of the auto scaling this would automanictly scale base on the capcity needs and change it when need.

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