# HA

## Health monitoring

## Auto healing

## High Availability

## Intelligent scaling

## Vertical Scaling
you can scale for more performance. from t2.mirco to a m5.large and from m5.large to t2.mirco


## Horizontal Scaling
This is scaling machine of the same instance type i.e using a t2.micro for use in the asg.


## Launch Config
* Can work with on demand or spot instances.
* Can attached a IAM role if you so wish.
* Enable cloudwatch for montioring.
* From the advance setting you can add userdata, ip address, RamDisk, KernalId.

ML used predtive scaling takes alook at the history
mamul
dymanic
sechdule
stress test

Application Auto Scaling
* spot fleets
* dyno db
* ecs containers

## AWS Auto Scaling
This is a scaling plan

Depencey for any autoscaling group, would be to use a lauch template and launch config
Spot fleet instance and ecs cannot not be discovered using tags. If you spin the spot fleet up using a cloud formation then you would be able to use the auto scale policy

traget trackling  default

step scaling more advance.

Auto Scaling with Dyno DB Nosql (tables) read and write, No VMs
on demand is not avaiable on demand.

Provisned uses auto scaling and creat scaling plans


Aurora Replics in Autoscaling
RDS can add auto scaling.  After creating the autoscaling plan this will then create read database called application-autoscaling-uid number (muilit read)

serverless = autoscales automaticly once setup this is base on the capcity settings



