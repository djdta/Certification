## 5.2 Configure domains, DNS services, and content delivery

## DNS Overview

Here below is the type of records that are used when configuring DNS or Route 53
- SOA
- A
- NS
- CNAME
- ALIAS
- TXT

## Route 53 Resolver
In this service you get the following zones

- Amazon Provided Zones
- Hosted Zone

- Regional Based Service
- Local requests by default
- Endpoint Resolver
- Inbound resolves forward requests.
- Outbound fowards requests.
- Autodefined and Custom Rules
  - Private hosted Zone and Amazon internal domains

### Route 53 Endpoints
- Inbound or Outbound it cannot be both.
- Uses an Elastic Network Interface.
- Connection between endpoint and your network.
- No Peering is required for resolution.

### Example of  Code for Route 53 Endpoints
- [Route 53 Endpoints Terraform](Template)
- [Route 53 Endpoints aws cli](Template)

### Amazon Provided Zones
VPC Attributes need to be added when creating a new VPC, By default the following attributes are set.
- enableDNSHostnames
- enableDNSsupport

With custom VPC creation only enableDNSHostnames is true

### Host Resolution
The Route 53 resolver is listening on the following
- +2 on the cidr range
- On a 169.254.169.253

[DNS Flow amazon Diagram](Template)

### Private Hosted Zone
- Use Route 53
- Enable custom Domain Usage
- Multi VPC Support
- Cross Account Support through AWS cli only
- DNS Support and Hostnames
- Support Routing and Health Polices
- Split View DNS.

[DNS Private Flow Diagram](Template)

### Example of  Code for DNS Private Zones
- [DNS Private Zones Terraform](Template)
- [DNS Private Zones aws cli](Template)

### Private DNS Server
- Setup the DNS feature on EC2
- Create custom entry domains.
- Set the enableDNSsupport to False
- Configure the following DHCP options
  - domain-name-servers (max 4)
  - domain-name
  - netbios-name-server (max 4)
  - netbios-node-type

## Route 53
- Hosted Zones
- Health and Routing Polices
- Resolver
- Domain Registration.
  - Register of a New domain
  - Verify Domain
  - Domain added in Route 53
- Other Providers
  - Register domain with provider
  - Create hosted zone in Route 53
  - Update name servers with provider.

### Example of  Code for Route 53
- [DNS Private Zones Terraform](Template)
- [DNS Private Zones aws cli](Template)

- SOA
- A = Maps names to ipv4
- AAAA = Maps names to ipv6
- NS
- CNAME = Maps Names to Other Names
- TXT = One or more strings.
- PTR = Maps ips to names 
- SRV = Maps a service to a name.

### Alias Settings
- Routes to selected AWS Resources
- Available at the top of the DNS namespace
  - CNAME records are not supported.
- Automatically update base on resource
- Uses default TTL of resources or records
- Alisa based queries are free.

## Routing Polices
- Simple
- Failover
- Weighted
- Mulitvalue answered
- Geolocation
- GeoProximity
- Latency

### Simply
[Simple Diagram](Template)

### Failover
[Failover Diagram](Template)

### Weighted
[Weighted Diagram](Template)

### Mulitvalue answered
[Mulitvalue answered Diagram](Template)

### Geolocation
[Geolocation Diagram](Template)

### GeoProximity
[GeoProximity Diagram](Template)

### Latency
[Latency Diagram](Template)

### Health Polices
- Endpoint Monitoring check for 200 response
- Calculated Health Checks
- CloudWatch Alarms.
- Can configure failover and routing.
- Route 53 checks policy and health
- None healthy means ALL records
- Alias records can check resource health

### Geo Location
- Localized and restrict
- Uses EDNS0 to estimate location
- Location is based on query and not on client.
- Most specific wins
- Create a default record

### Example of  Code for Geo Location
- [Geo Location Terraform](Template)
- [Geo Location aws cli](Template)

### GeoProximity
- Location of Uses and Resources.
- Requires Traffic flow in order for this feature to work.
- Resource Location
  - AWS Regions
  - Longitude and Latitude
- Use location by DNS Query
- Fine Tune with Bias.

### Latency
- Latency between query and region
- Records associated with region.
- User location base on DNS query

## Web Site running in S3
- Uses website endpoints
- Does not support HTTPS
- Added a CNAME record rather than the S3 bucket name
- Use custom names i.e Alias.
- Update Bucket Permissions.
- S3 does not have Folders
- Error Documents and redirects are supported.

### Example of  Code for S3 Website
- [S3 Website Terraform](Template)
- [S3 Website aws cli](Template)

### S3 with Route 53
- Can create simple alias records.
- Apex records are allowed
- Bucket name must match Domain Name.
- Redirect to Subdomain if desired.

## Cloudfront
- Content Delivery Service
- Use edge location location across the global.
- Supports Static and Dynamic Web Sites.
- User Requests are route to the lost latency location.
- Content copied from origin servers and cached.

### Cloudfront Components
- Origin Servers
- Distributions
- Polices

### Cached Key
- Match cached object to request
- Default Key
  - Cloudfront Domain
  - URL path of object
- Control cache key with polices.
- Custom or Managed Policies

### Origin Requests
- Request from cloudfront to origin server.
- Occurs on a cache miss.
- Default Info
  - URL Path
  - Request Body
  - Cloudfront HTTP headers added
- Controlled by origin request policy
- Custom or Managed Policies

### Securing Access Content
- Enable HTTPS
- Custom Domain Names can be used with HTTPS
- Private content options
- Restrict access with Origin Access Identity

### Cloudfront with Route 53
- Create a simply Alias Record
- Apex Records are allowed with Alias
- Alias records can point to a Cloudfront DNS name
- Additional subdomain records can be used.