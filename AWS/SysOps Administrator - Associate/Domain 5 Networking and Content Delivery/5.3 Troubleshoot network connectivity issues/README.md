## 5.3 5.3 Troubleshoot network connectivity issues

## VPC Components

The core components of a VPC are list as follows

- Subnets
- Routing Table
- Endpoints
- Gateways
- Security Groups
- NACLs (Network Access Control Lists)

## Troubleshooting Connectivity

Trouble shooting network issues are bas on a simple diagram.

source ============> destination
source <============ destination

### Question

Q1 Does the network packet know how to get there?
Answer = Check DNS resolution (Domain Name Servers).

Q2 Can the network packet route correctly? i.e can it get there.


Q3 Can the network response route back?
Q4 Is the network packet allowed through security groups or Network Access Control List?

Q5 Is the AWS resource alive and listening?

### Example of Connectivity Troubleshooting

- [Connectivity Troubleshooting Terraform](template)
- [Connectivity Troubleshooting aws cli](template)

### Finding Information

List below is the best place to find information when your are troubleshooting an issue.

- Console
- Cli use
- Networking Tools
  - Dig = DNS checker
  - mtr
  - Traceroute
  - hping3
  - tcpdump
- Logs
- System Manager
  - AWSsupport-SetupIPMonitoringfromVPC
  - AWSsupport-ConnectivityTroubleshooter
  - Reachability Analyzer

## Logs

### VPC Flow Logs
- Creates flow log records this base around the the metadata and not the payload itself.
- Can apply this to VPC Subnets and Network interfaces
- Traffic Selections
  - All
  - Accepted
  - Rejected
- Storage of logs can be S3 or Cloudwatch
- Format can be custom or default
- Aggregation Interval

### Example of VPC Flow Logs

- [VPC Flow Logs Terraform](template)
- [VPC Flow Logs aws cli](template)

## VPC Interconnection

### VPC Peering

List of Unsupported options

- Overlapping Cidr Ranges
- Transitive Peering
- Edge to Edge routing is not supported

### Example of VPC Peering

- [VPC Peering Terraform](template)
- [VPC Peering aws cli](template)

### Common Errors
- Incomplete Peering
- Route Tables missing entries
- Misconfigurations in the Security Groups
- Unsupported Configurations.

### Troubleshooting VPC Peering
- Cloudwatch
- Cloudtrail
- Reachability Analyze
- VPC Flow Logs

## Hybrid Connections

### VPN Gateway

### VPN Routing
- Static or Dynamic Routes with bgp.
- BGP is a HA for routing.
- Route tables can ingest propagate routes.
- Route ordering is important (more specific wins) Preference list below.
  - Local.
  - BGP with Direct Connect.
  - Static to VPN Gateway.
  -  BGP from VPN Gateway.
  -  AS PATH and MED as a tie breaker.

### VPN Direct
- Private connections to AWS
- Consistent network experience
- Connect to any AWs service and VPC in any region.
- Multiple physical  connections.
- Multiple port speeds.

### Common Errors

### VPN Errors
- Customer Device Configurations error.
- Tunnel Settings
- Incorrect routing details

### Direct Connections Errors
- Physical Devices
- Virtual Interface.
- BGP Peering Connections.
- Incorrect routing information.

## Transit Gateways

- Regional Virtual Router
- Supported device
  - VPCs
  - VPN Connections
  - Direct Connect Gateways
  - Transit Gateways Peering.
- Cross account support with aws.
- Managed by AWS

### Transit Gateways common errors
- Transit Gateways Association.
- Local Routing.
- Transit Gateways Routing table.
- Transit Gateway Routing.

### Troubleshooting Transit Gateways
  - Reachability Analyzer
  - Networking Tools
    - Dig = DNS checker
    - mtr
    - Traceroute
    - hping3
    - tcpdump
- Cloudwatch
- Cloudtrail
- VPC Flow Logs

### Example of Transit Gateway

- [Transit Gateway Terraform](template)
- [Transit Gateway aws cli](template)

## Load Balancer and Security

### Elastic Load Balancers
- Application Load Balancer
- Network Load Balancer
- Gateway Load Balancer
- Classic Load Balancer

### Application Load Balancer
- Load Balancer
- Listener
- Targets Group

### Monitoring Load Balancers
- Enable Cloudwatch logs
- Access Logs
- Request Tracing
- Enable Cloudtrail.
- Instance Logs for details.

### Troubleshooting Load Balancer
- Instance States checks
- Health Checks
- Security Groups and ACLs
- Availability Zones.
- Peered VPC

### Listener
- Public Subnet
- Security Groups and ACLs
- Client Preservation (NLBs only)

### Example of Application Load Balancer

- [Application Load Balancer Terraform](template)
- [Application Load Balancer aws cli](template)

## Web Application Firewall
- Web ACLs **Evaluates the Request**
- Rules and Groups **Determines the Action**
- Actions **What to Apply**
- Resource
  - Cloudfront
  - Application Load Balancer
  - API Gateway REST API
  - App Sync GraphQL API

### Troubleshooting WAF
- Set the Rule to Count
- Set default action to allow.
- Cloudwatch to monitoring matches
- View an sample request
- Logging through Amazon Kinesis Data Firehose

## Cloudfront

### Monitoring Cloudfront
- Cloudfront access and real time logs
- Cloudwatch Matrix
- Cache hit ratio
- Max ago of the cache objects
- Content caching options
  - Query String, cookies and headers.
- Origin Shield
- Origin Failover
