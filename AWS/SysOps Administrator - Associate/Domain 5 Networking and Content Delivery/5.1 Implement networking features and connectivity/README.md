## 5.1 Implement networking features and connectivity

## Amazon Virtual Private Cloud **VPC**
- VPC are Regional.
- VPC when created needs a IPv4 Cidr block
- IPv6 is supported when creating a VPC
- Tenancy Option must be selected.
- Each VPC needs to be divided into subnets in order for use.
- Each subnet is map to availability Zone
- Interfaces are used to connect to subnets.
- VPC have the ability of Route Tables.
- The use of Internet Gateways.
- Security Groups and Network Access List

### Subnets
- Public Subnets
Provides private an public ip address through a internet gateway.

- Private Subnets
Private ip address are routed through a nat gateway.

## Route Tables.
- There is always a Local Route
- Each subnet only uses one route table. A route table can use many subnets.
- Route Table also has a default internet route.
- Routes to other AWS services.
- Routes to other VPC

### Example of  Code for VPC
- [Virtual Private Cloud Terraform](Template)
- [Virtual Private Cloud aws cli](Template)

## Network Access Control List
Table below shows the differences between the two.

|Security Groups |NACLs |
--- | --- 
|Associated with instances or interfaces|Associated with subnets|
|Allow Rules|Allow and Deny rules|
|Stateful|Stateless|
|Order of rules not important|Ordered is important|
|Security groups can reference each other|

- Instances need the same rules should use the same Security Groups.
- Subnets that use the same rules use the same NACLs

### Security Group Chaining

======> **ELB SG**(Traffice from the Internet) =======> **Web Tier SG** (Allow traffice from ELB) ========> **Application Tier** (Allow traffic from Web Tief) ========> **Database Tier SG** (Allow only traffice from Application Tier) 

## VPC Connectivity
- Multi Region Architecture
- Workload isolation
- Corporate Mergers

### Connecting VPC Together
- Deploy EC2 instances and connect via VPN
- VPC Peering
  - Non Transitive cannot share internet gateways, virtual private gateways.
  - Non Over lapping IPs Ranges
- Transit Gateways for connectivity

### Transit Gateways
- Regional Service
- Can attach to many VPCs
- Multi transit gateways can connect to VPCs across regions
- Multi Path Routing with equal cost.
- Multiple route tables.
- Can connect to on prem with VPN or direct connect

### VPC Endpoints
There 3 different type of endpoints to use.
- Gateway Endpoints Creates Routes in the Routing Table.
- Interface Creates a interface to forward traffic.
- PrivateLink Creates a Endpoint which is used by AWS Backbone.

### AWS Managed VPNs
- Virtual Private Gateways Each VPC would need its own virtual private gateway
- Transit Gateways One transit gateway can ben shared with many VPC.

### Example Code for VPC Peering
- [VPC Peering Terraform](Template)
- [VPC Peering aws cli](Template)

## Sessions Manager
- Centralized Control to VMs
- IAM polices to control access.
- No open Ports or bastion hosts.
- Need to install the SSM agent on EC2
- Attach a instances profile to the VM

## VPC Protection Services

### AWS WAF
- Protect Web services and APIs from common threats


### AWS Shield
- AWS Shield Protects against DDoS
     - Shield Standard is a always on service
       - Real Time inspect
       - Static Thresholds
       - Inline
     - Shield Advanced
       - Tailored Detection
       - Proactive response to threats
       - DDoS Cost Protection
       - Centralized  Protection Management

### Example Code for AWS WAF
- [AWS WAF Terraform](Template)
- [AWS WAF aws cli](Template)
