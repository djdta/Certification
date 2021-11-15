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
- [Data Lifecycle and Manager Terraform](Template)
- [Data Lifecycle and Manager AWS Cli](Template)

### AWS Backup
This is a service you need to enable which one you would like to use i.e S3 bucket,FSx.

### Example AWS Backup
- [AWS Backup Terraform](Template)
- [AWS Backup AWS Cli](Template)

## Restoring Database
- A restore to a point in time.
- Restoring for a Snapshot.
- Read Replicas can be **promoted** in DR situation
- Backup and Restore options in Aurora.

### Point in time backup
- Restoring from a point in time backup creates a new instances.
- Keep the restore backup to the same or similar size from previous.
- AWS Backup solution can be used to restore a point in time backup.

### Example Point in time backup
- [Point in time backup Terraform](Template)
- [Point in time backup AWS Cli](Template)

### Snapshot restore
- Snapshot restores creates a new database instance.
- Cannot restore is snapshot is shared or encrypted. **To resolve this Create a copy of the snapshot and restore from the copy**.
- When restoring from a snapshot you cannot use a different storage type.
  
  ### Example Snapshot restore
- [Snapshot restore Terraform](Template)
- [Snapshot restore AWS Cli](Template)

### Promoting Read Replicas
- Promoting a Read Replica will **reboot the instance**
- After promoting the Replica it acts like another DB instances.

  ### Example Promoting Read Replicas
- [Promoting Read Replicas Terraform](Template)
- [Promoting Read Replicas AWS Cli](Template)

## Understanding the Backup and Restore options with Aurora
### Backups
- Cluster Volume backed automatically during a desired window.
- Retains stored data for the backup retention period **default 1 day**
- Backups are continuous and incremental.
- Manual Snapshots are possible.

### Restore
- Create a new database cluster from a snapshot.
- Point in Time restore in the backup retention period.
- Can clone database clusters from one to another.

### Backtracking
- Feature must be enable when creating a new database cluster.
- Rewinds the database to a point in time. **Undo a destructive operation**
- Rewind does not need another cluster and the rewind takes minutes.
- Backing tracking has a limit of up to 72hours.

  ### Example Backtracking
- [Backtracking Terraform](Template)
- [Backtracking AWS Cli](Template)

## S3 Versioning
Notes to consider for the exam are.
- Versioning enabled  and suspended at the bucket level. This keeps multi variants of files.
- Once enabled can never be disabled only **suspended**
- Versioning will always can give you a new uuid
- Existing file will get a null uuid number.  When the files are modified then a uuid will be give.
- You can have millions of files versioned.
- S3 will start **throttling requests, resulting HTTP 503 errors**
- Use S3 inventory tool to identity objects.
- Expiration polices can help in resolve this issue.

## S3 Lifecycle
Here below is the lifecycle option for different S3 buckets and tiers.

[S3 Lifecycle](Template)

- Object need to be in a bucket for 30 days before transitioned.
- Cannot transition from any storage to S3 standard storage.

 ### Example S3 Lifecycle
- [S3 Lifecycle Terraform](Template)
- [S3 Lifecycle AWS Cli](Template)