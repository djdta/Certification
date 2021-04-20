## Deployment and Provisioning
---

#### Summary

This section will cover all access of deployment and provisioning resources inside the aws cloud platform.  With all the further headings these are bullet points and the information is base on past deployment challenges.

## Infrasture Deployments and Provisiong

- EC2 deployments
    - With asg groups and templates
    - with Custom images
    - connected to the load balancer

- Networking and limits
    - VPC creation.
    - Subnet creation.
    - VPC peering connection.
    - Load Balaners and how to use.
    - Internet gateway and how to you use.
    - Route tables and how to use.
    - Beware of any overlapping ips when creating vpc.
    - The ability to use flow logs.
    - Can use cloudwatch
    - Can use s3 bucket to store them
    - Can log accepted and reject flows
    - You can log flows for vpc, subnets, network interfaces.
    - Logs will only show primary ip address of vpc resources
    - Flow logs does not log DNS, DHCP NLB or 169.254.169.0

- IPv6
    - AWS assignes a /56 block to vpc
    - You assign a /64 block to a subnet
    - Only some instances support ipv6
    - IPv6 id not supported for vpn connections, NAT gateways, or VPC endpoints
    - IPv6 is also supported for endpoints accessed via the internet
    - IPv6 is supported for VPC peering.  

- Limits
    - Do not allow AWS to pick a zone for your.
    - Inter-region peering doesn't support ipv6
    - Peered VPCs must not have overlapping IP Cidr blocks
    - An instance in one vpc can't use the internet gateway in a peered vpc.
    - The same limitions apply to the NAT gateways, virtual private gateways and other VPC peering connections.
    - No real time logging. (10mins writing.)
    

- Storage
    - S3 Buckets with private access.
    - S3 buckets with public access.
    - S3 bucket as a static website.
    - Policy and archive data
    - S3 Glacier for archive of data and the use of the tiers to use.
    - S3 Deep Archive which gives a long to keep data
    - Replication of data for protection.
 


## Provisioning
---

#### Summary

In this section the will go through some of the options in regards to provision some of these services.  There will be some provisioning tools that may not be in the exam, but i am adding this information in as i belive this would be helpfull in the future.

- Terraform
    - Is cloud agnostic and supports AWS api
    - Can provision all AWS resouces
    - EC2
    - S3
    - Lamda
    - Cloudwatch
    - CloudTrail
    - IAM Role, Users and Groups
    - Can debug issues if needed.

- Cloudformation
    - EC2 Cloudformation templates.
    - S3 Bucket Cloudformation templates.
    - Cloudformation templates can only be used in the AWS platform.
    - Cloudformation template are in json files.
    - VSC can be used to control change in the template.
    - Can use IAM Cloudformation templates to control

- AWS CLI
    - Can Provision all AWS resouces
    - You can wrap this into a python or bash.
    - For montioring you can verbose this for troubleshooting.

## Further Studying
---

![link] benpiper.com/invaild-vpc