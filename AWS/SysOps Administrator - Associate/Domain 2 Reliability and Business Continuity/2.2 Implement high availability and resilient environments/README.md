# Domain 2 Reliability and Business Continuity notes

## AWS Global Infrastructure
Just to basic around AWS infrastructure and what terms you will see through out this study notes.

- Regions
    - Located around the world  
    - Provision services to the users you want to server.
    - Host web application where you targeting the users.
- AZ
  - Independent power an cooling
  - Multi network Redundant Connections.
  - Availability Zone
  - Single Datacenter

## Elastic Load Balancer with High Availability
Here below is some of the feature a load balancer with high availability can give in your infrastructure.

- Application Load Balancer with [Auto Scaling](https://github.com/djdta/Certification/blob/master/AWS/SysOps%20Administrator%20-%20Associate/Domain%202%20Reliability%20and%20Business%20Continuity/2.1%20Implement%20scalability%20and%20elasticity/README.md) groups
- Load Balancers sit between EC2 and users
- Health checks and routes to healthy instances.
- SSL Termination.
- Layer 7 load balancing HTTP / HTTPS
- Server Name Indication
- IP Address as targets
- Lamda Functions as targets
- Host / Path based routing
- Containerzied application support
- Sticky sessions support (Maintain client connection to the server)
- Secuirty user authentication and WAF
- Cross zone load balancing
- Elastic load balancer is a regional service.

Example of a Loadbalancer in HA use case.

![Load Balancer Use Case](/AWS/.assets/LoadBalancer.png)

### Example LoadBalancer with HA
- [LoadBalancer HA Deployment Terraform](https://github.com/djdta/Certification/tree/master/AWS/SysOps%20Administrator%20-%20Associate/Domain%202%20Reliability%20and%20Business%20Continuity/2.2%20Implement%20high%20availability%20and%20resilient%20environments/Load%20Balancer)
- [LoadBalancer HA Deployment AWS Cli](Template)

## Self Healing with Autoscaling
Using self healing with auto scaling groups to sel heal any issus.  Here below is a use case and code of you to test and play.

![Self Healing  Use Case](Template)

### Example Self Healing
- [Self Healing Deployment Terraform](Template)
- [Self Healing Deployment AWS Cli](Template)

## Multi AZ RDS Deployments
This is Multi AZ RDS Deployment has the following benefits for scale and High Availability.

- Spans over 2 availability zones.
- Can convert a non multi AZ deployment.
- RDS maintains a synchronous standby replica
- Automattic Failover
- One Single DNS endpoint to connect to.

### Example Multi AZ RDS Deployment
- [Multi AZ RDS Deployment Terraform](Template)
- [Multi AZ RDS Deployment AWS Cli](Template)

## Amazon Elastic File System
This service is a managed service by amazon which host share folders for ec2 machine.  Here below is the feature that are used.

- Managed network file system.
- Replace for the traditional files servers.
- NFS is supported.
- Share across EC2 instances.
- Standard Storage for HA
- One Zone Option with this option you may incur charges.