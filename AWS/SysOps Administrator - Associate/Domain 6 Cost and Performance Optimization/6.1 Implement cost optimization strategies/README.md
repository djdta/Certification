## 6.1 Implement cost optimization strategies

## AWS Cost Explorer
Visualize and analyze cost and usage
Forecast spending up to 12 months (and analyze 12 months of historical data).

Utilization and coverage reports
- Reserved instances (RI)
- Savings plans

### Cost Allocation Tags
Cost allocation tags that can be used to help with finops and budget controllers.

- User-defined labels for control
- AWS generated labels for control

## AWS Budgets and Billing Alarms
|Billing Alarms |AWS Budgets |
--- | --- 
|Monitor costs with Cloudwatch|Budgets for specific AWS resources|
|Alarms when cost exceeded|Set up alarms when the cost exceeds the budget|
|Enable billing alerts inside of the billing dashboard|More advanced then billing alarms|
|Data is in the us-east-1 region|Set up alarms on the forecasted cost|

## Budget Types
The list below is the types of budget controls that can be put in place.

- Cost budget
- Usage budget
- Reservation budget
- Savings Plans budget

## AWS Trusted Advisor

Automated advisor service

- Ability for Saving money
- Improving performance on Resources been used.
- Securing the system when required.
- Cost optimization
- Performance
- Security
- Fault tolerance
- Service limits

## AWS Compute Optimizer
Machine learning is used

Recommendations for:
- Auto Scaling groups
- EBS volumes
- Lambda functions
- EC2 instances

## Assessing Resource Usage Patterns in AWS

EC2 Instances Purchasing Options

- On-Demand Instances
- Dedicated Hosts (and Instances)
- Reserved Instances
- Savings Plans
- Spot Instances

### On-Demand Instances

- Pay only for the compute capacity you use in your aws environment.
- No long-term commitment, no upfront cost.
- **Auto scaling groups**, **unpredictable short-term**, irregular workloads that **cannot** be interrupted.
Great for development and testing purposes

### Dedicated Hosts (and Instances)

Most expensive purchasing option Running on dedicated hardware that is
physically isolated from other AWS customers
Usually used to meet the regulations and increase security

### Dedicated Instances

Dedicated Instances
- Might share the dedicated hardware with other not dedicated instances from your account.
- After running stopped instance, the new dedicated hardware might be a different physical machine.
- Pricing is hourly per instance usage fee and a dedicated per region fee ($2/hour).

### Dedicated Hosts

Dedicates Hosts
- Always the same dedicated machine
- More insight into the host, you decide which instances will run on it.
- Allows us to use existing per-socket, percore or per-VM software licenses.
- You pay hourly for a single physical host based on instance type.

### EC2 Instances Purchasing Options

- On-Demand Instances
- Dedicated Hosts (and Instances)
- Reserved Instances
- Savings Plans
- Spot Instances

## Reserved Instances

- Discount off On-Demand Instances by making a long-term commitment.
- Reserve capacity for one-year or a three-year term
- Upfront payments will reduce the hourly rate.

Payment options:
  - No upfront
  - Partial upfront
  - All upfront

### Standard Reserved Instances
- Provide a bigger discount
- Can only be modified
- Can be sold on AWS Marketplace
- Can change the AZ, instance size and networking type

Convertible Reserved Instances
- More flexibility
- Can change instance family, OS, tenancy and payment options in addition to standard RI possible modifications
- Predictable workloads with steady state usage patterns
- Production environment running on instances for a longer period of time.

## Savings Plans

Discount off On-Demand Instances by making a long-term usage commitment (measured in $/hour).
Consistent amount of compute usage for one-year or a three-year term.

EC2 Instance Savings Plans
- Provide a bigger discount
- Commit to instance family and region
- Can change the AZ, instance size, OS and tenancy Compute Savings Plans.
- More flexibility
- Change instance family, instance size, AZ, region, OS and tenancy.
- Also apply to Fargate and Lambda

Used for steady state workloads that require
flexibility
Great for projects that use a mixture of
computing services

## Reserved Instances vs. Savings Plans
|Reserved Instances | Savings Plans |
--- | --- 
|Long-term commitment on instance capacity|Long-term commitment on compute usage (specific amount of $/hour)|
|Standard RIs can be sold on AWS Marketplace|Compute Savings Plans can change the region and be shared amongst more compute services|
|Also available for database services|In general more flexible then RIs|
|Compute capacity guarantee|

## Spot Instances

- EC2 instance compute capacity are Up to 90% lower costs compared to On-Demand price
- Each combination of availability zone, instance size and instance type makes a distinct capacity (spot) pool.
- Price in a capacity pool fluctuates based on demand.

### Capacity (Spot) Pools
- c3 + large + us-east-1a
- c3 + 2xlarge + us-east-1a
- c3 + 2xlarge + us-east-1d
- r4 + xlarge + us-east-1d
- r4 + 2xlarge + us-east-1b
- c3 + 2xlarge + us-east-1d

### Spot Instance Interruption
Instances will be interrupted if the following happens

- Required capacity is not available
- Price is greater then the maximum price
- On-Demand price by default, but you can also set it yourself

Interrupted instances can be:
- Terminated
- Stopped
- Hibernated
- Maintain target capacity – automatically replace interrupted instances. 

You get a 2 minute warning before the instance is interrupted

Spot block
- Guarantees that instance will be available for 1 to 6 hours

### Spot Fleets
Fulfills your capacity request by using instances from multiple capacity (launch) pools.

Fleet allocation strategies
- Capacity optimized.
- Lowest price.
- Diversified across instance pools in my fleet.
- More consistent savings.

### Spot Instances

Workloads resilient to failures that can with stand interruptions
Used for time insensitive workloads
- Batch jobs, development, testing, onetime
queries, data analysis.
- Time sensitive workloads like stateless, fault tolerant, loosely coupled and multi-AZ.
- Big data, web services, containerized workloads, API endpoints, CI/CD, high performance computing (HPC), DNA sequencing, media transcoding, visual effects rendering, image processing.

## AWS Elastic Beanstalk
PaaS (Platform as a Service) solution for deploying and running managed web applications
Handles the deployment, capacity provisioning, scaling, load balancing and application health monitoring
Gives you the full control of the underlying resources
- Service is free, you just pay for the underlying resources
- Supports Java, .NET, PHP, Node.js, Python, Ruby, Go, Docker containers...

### Use AWS Elastic Beanstalk
Easily deploy an application while maintaining control of the underlying resources.
- Quickly upload code and let AWS take care of
load balancing, auto-scaling, application health monitoring and capacity provisioning.
PaaS service which can easily orchestrate
provisioning of resources for applications
- E.g. web applications that need integration
with RDS or SNS

## AWS Lambda

- Serverless compute service (FaaS)
Run code without resources been deployed
- Pay per request and compute time
- Code Executes when needed and provides automatic scaling
- Natively supports: Node.js, Java, C#, Go, Python, Ruby, PowerShell.

### Opportunities to Use AWS Lambda

- Cost-effective and highly available solution for running certain code when a specific event happens.
- Integration with a lot of AWS services

Benefits over EC2 instances:
- Pay for what you use
- No management of underlying infrastructure
- Automatic scaling

## Amazon Elastic Container Service (Amazon ECS)

Container management service for orchestrating Docker containers on a cluster Manages a cluster of EC2 instances which run the ECS agent
Uses Docker images from Docker Hub (public) or from Amazon ECR (Amazon Elastic Container Registry) private image repository

### Opportunities to Use Amazon ECS

- Managed service that runs containers in AWS
Good for ETL (Extract-Transform-Load) workloads and distributed microservices.
- Offers better memory utilization than EC2 instances

### Amazon Elastic Kubernetes Service (Amazon EKS)

- Highly-available, secure clusters for scaling Kubernetes applications.
- Automatic patching, node provisioning and updates
- Managed Kubernetes services on AWS

## AWS Fargate

Serverless compute engine for containers that works with ECS and EKS
Removes the need for managing infrastructure (provisioning of EC2 instances which run containers). Configure cluster infrastructure with task definitions

### Opportunities to Use AWS Fargate

- Managing container clusters
- Running containers in AWS, without provisioning of EC2 instances

## AWS Batch

- Runs batch jobs on AWS
- Manages scaling and job queues
- Accounts for dependencies between jobs

## Opportunities to Use AWS Batch

- Batch workloads and account for dependencies between jobs
- Moving on-premises batch jobs system to AWS
- Uses ECS Agent to execute batch jobs from containers
- Good opportunity to utilize Spot Instances

## Amazon Elastic File System (Amazon EFS)

- Fully-managed scalable file storage service 
- NFS protocol can be used
- Elastic and scales up to petabytes
- Concurrently connect to multiple EC2 instances

### Opportunities to Use Amazon EFS

- File system that needs to have ability to burst, support high throughput and encrypt data at rest and also in transit
- Storage solution with mounted file system for big data and analytics, media processing workflows and content management
- File system that can be concurrently accessed by multiple EC2 instances.
Network file share can replace on-premises file server

## Amazon Simple Storage Service (Amazon S3)

- Provides managed durable and highly available object storage
- Stores data as objects inside of buckets
- Object versioning
- Storage capacity is unlimited
- Offers multiple storage classes

### Opportunities to Use Amazon S3

- Storage works well with APIs
Store data in multiple regions to offer high availability and replication.
- Save money on data which is not accessed
frequently
- Ability to run static website for a s3 bucket
- S3 Glacier can archive data

## Amazon Relational Database Service (Amazon RDS)
Managed SQL database service which handles
backups, software patching, automatic failure detection and recovery
Supports Aurora, MySQL, MariaDB, PostgreSQL, Oracle and Microsoft SQL Server.

### Opportunities to Use Amazon RDS

- Move relational OLTP databases to AWS without maintaining servers and operating systems
- Automatic failover between availability zones
- Horizontal and vertical scaling
- Continuous backups, point in time restore
- Read replicas
- Multi AZ setup for disaster recovery
- Automatic provisioning

## Amazon Aurora

- Cloud optimized technology from AWS
- Fully managed relational database engine compatible with MySQL and PostgreSQL.
- Uses high–performance, automatically growing storage subsystem
Fault-tolerant and self-healing
- Better performance for MySQL and PostgreSQL than RDS

### Opportunities to Use Amazon Aurora

- Move on-premises MySQL database to AWS which is expected to triple in size every few months
- Support cross region replication for your database

## Amazon DynamoDB

- Fully managed, highly available NoSQL database service that provides fast and predictable performance
- Scales to massive workloads without downtime or performance degradation.

### Opportunities to Use Amazon DynamoDB

-  Managed scalable service for moving your on-premises
- NoSQL database to AWS
- Need data store which has no schema, supports strongly consistent reads and stores data in tables, indexed by a primary key
- Large ingestion of dynamic data with low
latency
- Push button scaling – scale at any time
without downtime

## Amazon Redshift

- Fully managed, petabyte-scale data warehouse service OLAP type of database.
- Ten times faster than a traditional SQL database Includes columnar storage, data compression, massively parallel processing architecture, result caching and machine learning to achieve high throughput

### Opportunities to Use Amazon Redshift

- Complex analytic queries against petabytes of structured data
- Data warehouse solution that makes it costeffective
to analyze data using standard SQL and existing Business Intelligence (BI) tools 
- Large reports which include complex queries

### Opportunities to Use Amazon Elasticache

- Distributed in-memory cache environment
- Support Redis and Memcached engines
- Reducing load off of databases
- Improve database performance read-heavy workloads
- Decouple application to make it more highly available
- Managing session state instead of web servers
and load balancers

### Opportunities to Use Amazon Simple Notification

Service (Amazon SNS)
- Managed event-driven, messaging service for sending SMS and email notifications.
- Get notified in real-time when Amazon CloudWatch alarm is triggered

### Opportunities to Use Amazon Simple Queue

Service (Amazon SQS)
- Highly available message queueing service
that offers FIFO at-least-once delivery Integrate and decouple distributed software systems
- Remove stress from the backend by allowing it to pull messuages from the queue when ready

### Opportunities to Use AWS Directory


- Managed service for Microsoft Active
- Standalone Microsoft Active Directory compatible
service powered by Samba
- Supports Windows workloads that need
basic AD features
- Least expensive AD option for less than 5000 users, when you don't need advanced AD features

### Opportunities to Use AWS OpsWorks
- Configuration management service for managing applications in the cloud by using Puppet or Chef
- Move your on-premises Puppet or Chef managed infrastructure to AWS