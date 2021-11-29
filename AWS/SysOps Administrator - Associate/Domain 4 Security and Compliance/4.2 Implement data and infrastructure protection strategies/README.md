# 4.2 Implement data and infrastructure protection strategies

## Encryption in AWS
## Data Classification
- Foundation step into Data Security
- Data been processed needs to be identify.
- Identified data should be classified.
- Each category of data needs its own security controls.

### Data Classification Process
- Establish a Data Catalog
- Assess Business functions and assess impact
- Label Handling
- Asset handling to there labels.
- Perform continuos monitoring.
- AWS Services used for this are AWS Glue, AWS Config and AWS Macie.

## Key Management
- Multi Tenet Service
- FIPS140 - 2 validated
- Creates and Managed Master Keys
- Integration with IAM
- Integration with Cloudtrail

## Encryption in Transit
- Sending Data between two endpoints. (Through VPN) or (HTTPS)


## AWS Certificate Manager
- Manages Public Certs
- Manages Private Certs
- Billing
- Region Service

### Steps for cert
Step 1: Request a Cert You must own the domain name
Step 2: Use the Cert by create a secure listener i.e ALB

### Example Code for Cert Manager
- [Cert Manager Deployment Terraform](Template)
- [Cert Manager Deployment aws cli](Template)

## AWS Secrets Manager
- Rotate Secrets Securely
- Manage Access Fine gained polices
- Security Audits Secrets.
- Replicates secrets to multi regions

### Steps for secrets
Step 1: Choose one of the Top 5 Secerts
 - Key to encrypt the secret.
 - Optional Resources Permissions.
 - Optional Replication.
Step 2: Rotation of Key

Table is the difference between Secrets Manager and Parameter Store.

|Secrets Manager |Parameter Store |
--- | --- 
|Password Generator|No Additional Cost|
|Secret Rotation|Secrets Can be Encrypted|
|Cross Account Access|Store Up to 4K of secrets|
|Secerts are Encrypted|
|Stores Values up to 10K|

- Focus on Credentials
- Wide Choice of Secrets

### Example of Secrets manager
- [Secrets Manager Terraform](Template)
- [Secrets Manager aws cli](Template)

## AWS Config
- Rules to evaluate configurations
- Remediation for non complaint
- Region by Region Tool
- Can aggregate data across accounts.
- 1-Click deployment through AWS Console
- Can used managed AWS rules or Custom Rules.

## Amazon Inspector
- Checks Network and accessability
- Checks Application exposure and Vulnerabilities.
- Gives a Detail Report.
- Integrates with IAM.
- Integrates with AWS System Manager.

### Rules Inspector
- Network Reachability
- Common Vulnerabilities and exposes.
- CIS Benchmark
- Security Best Practices

### Example code AWS config and AWS Inspector
- [AWS Config and Inspector Terraform](Template)
- [AWS Config and Inspector aws cli](Template)

## AWS Protection Service

### AWS Guard Duty
- Collects data from AWS accounts network traffic and S3 
- Guard Duty displays findings
- Automation of remediation.
- Region Basis

### Security Hub
- Aggregates findings from AWS Services
- Industry standards checks.
- Automate remediation.
- Works with AWS Config.
- Use of Security Hub with AWS Organization.

- Guard Duty Detects threats and attacks
- Inspects your Security exposure.

## Amazon Detective
- Use Data from Combine sources.
- Integrates with third party tooling.
- Machine learning to analyze data.
- Attempts to find root cause of issues.

### Example Code for Guard Duty
- [Guard Duty Terraform Deployment](Template)
- [Guard Duty Terraform aws cii](Template)