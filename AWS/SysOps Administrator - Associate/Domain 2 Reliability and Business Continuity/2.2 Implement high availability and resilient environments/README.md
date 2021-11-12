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