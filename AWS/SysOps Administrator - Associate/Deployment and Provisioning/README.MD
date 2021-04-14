## Deployment and Provisioning

* VPC Peering


Building
 x1 vpc = Web-vpc
 x1 igw
 x1 route table
 x1 web server

 x1 vpc = shared-vpc
 x1 route table
 x1 db1 server

Note

* Beware of any overlapping ips when creating vpc
* Do not allow AWS to pick a zone for your

VPC Peering
* Inter-region peering doesn't support ipv6
* Peered VPCs must not have overlapping IP Cidr blocks
* An instance in one vpc can't use the internet gateway in a peered vpc
* The same limitions apply to the NAT gateways, virtual private gateways and other VPC peering connections.
![link] benpiper.com/invaild-vpc
* VPC Peering
