# Domain 2 Reliability and Business Continuity notes

Terms to be used when talking about backup and recovery are the following

- RPO
- RTO

In the following section below here is a table of how they are.

    | RPO                             | RTO |
    |---------------------------|-----------------|
    |  Recovery Point Objective  | Recovery Time Objective |
    |  Acceptable Data Loss      | Acceptable Downtime |
    |  Expressed in Hours  | Expressed in Hours |
    |  RPO of 1 hour means 1 hour data can be lost  | RTO of 1 hour Systems should running in 1 hour of outage |

Example below of RTO and RPO
![RTO and RPO Diagram](Template)

## Backup Features in AWS
Here below is a list of backup services that can be used in order to backup and restore date.

### EBS
  - Snapshots of EBS volumes
  - First snapshot is full and the rest are incremental
  - Stored in S3
### RDS
#### Automatic Backups
  - RDS automatically performs a full daily snapshot of your data during a preferred window.
  - Single Region
#### Snapshots
  - User-Initiated as frequently as desired.
  - Cross Region
#### Read Replicas
  - Used for scalability and can be used in a DR situation.  As replicas can be promoted.
  - Cross Region
### DynamoDB
#### On-Demand Table Backups
- Full Table Backup
### Storage Gateway
#### Type of Storage Gateway: File Volume and Tape
- Use the storage gateway for on-prem solution into AWS.

## Automating Snapshots and Backups

### Data Lifecycle and Manager
This service is used only with EBS volumes.

### Example Data Lifecycle and Manager
[Data Lifecycle and Manager Terraform](Template)
[Data Lifecycle and Manager AWS Cli](Template)

### AWS Backup
This is a service you need to enable which one you would like to use i.e S3 bucket,FSx.

### Example AWS Backup
[AWS Backup Terraform](Template)
[AWS Backup AWS Cli](Template)

