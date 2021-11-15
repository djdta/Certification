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
This service is a managed service by amazon which host share folders for ec2 instances.  Here below is the feature that are used.

- Managed network file system.
- Replace for the traditional files servers.
- NFS is supported.
- Share across EC2 instances.
- Standard Storage for HA
- One Zone Option with this option you may incur charges.

## Amazon FSx for Windows File Server
This service is designed for windows instances to connect to a windows share running in AWS which is managed by AWS.  Here below is some of the feature to be aware.

- Fully managed file storage with SMB protocol support
- Can choose between a single AZ or Multi AZ deployments.
- Specify preferred and standby of availability zones

### Example FSx for Windows File Server
- [FSx Deployment Terraform](Template)
- [FSx Deployment AWS Cli](Template)

## Route53 Health Checks
- Endpoints must be heathy to receive traffic.
- Monitor by IP or Domain Name.
- HTTP, HTTPS and TCP Traffic.
- Requests can be sent upto 8 different regions.
- Route53 Alias records can automatically evaluate target heath.

### Example Rout53 health check
- [Rout53 health check Terraform](Template)
- [Rout53 health check AWS Cli](Template)

## Route53 Routing Configurations
- Production ready infrastructure in different regions
- Simple Single Resource, Single Region
- Active - Active Availble in a second region
- Active - Passive Stand-by infrastructure region .

## Route53 Routing Polices
- Weight
  - Numeric propotion of traffic to route to the aws resource.
- Latencey
  - Routes traffic based on latency for th e users region
- GeoLocation
  - Routes traffic to the users location
- Latencey and Geolocation
  - Records will determine a users ip by location

### Example Route53 Routing Polices
- [Route53 Routing Polices Terraform](Template)
- [Route53 Routing Polices AWS Cli](Template)

For any outage please remove any loadbalancers