# 4.1 Implement and manage security and compliance policies

# Shared Responsibility Model

When we talk about the shared responsibility model for any cloud provider they would have a smilar answer that all of the datacentres,hardware and networking is reailiably and secure.  When you start using the services on there platform of choice, then the user should be responsibility for the up keep of any resources deployed.

That said all major cloud providers would have the tools to help in finding these issues and reporting them to you.  Again the tools would be at a price per hour.

Below is a link i have found in regards to the Shared Responsibility Model which should help in understanding further this requirement.

[Shared Responsibility Model](https://www.cloudpassage.com/articles/shared-responsibility-model-explained/)

## AWS IAM 
- Control access to aws resources in the cloud
- Always the first account is root.  Best practice **not to use**
- Users single unit which allows users to login.
- Users can have cli access without access to management console.
- Users with just management access does not have cli access
- User can setup mfa USB or Phone.

### IAM Federated Access
- The use of a Identity provider i.E **AzureAd Okta**
- Wed Identity Federation i.e Facebook, Google, OIDC app
- Saml 2.0 Federations Uses Saml assertions from Azure AD
- Allows the leverages of  STS roles.

### Best Practices
- Enable 2FA
- Password Polices
- Roles over users
- Least privileged Model
- Validation of Created Polices
- Roles to Resources.

## Auditing via AWS CloudTrail - Overview
- Enforce Governance, compliance and auditing for your environment.
- Actions are recorded via JSON events
- Enable as default.
- Historical Events last upto 90 days without a trail configured.
- Visibility on all actions in the aws account.

### Example Auditing Your AWS Account with AWS CloudTrail
- [Cloudtrail with S3 Terraform](Template)
- [Cloudtrail with S3 aws cli](Template)

## AWS IAM Access Analyzer
- Identify external shared resources.
- Organization Service
- Generates Findings

## AWS Organizations
- Account Management and Consolidation.
- Consolidating billing **Org Account pays for members account**
- Groupings of Accounts to manage
- Enabling services and feature across the Org
- Service Control Polices to allow granular control of allow and deny api calls.

## AWS Trusted Advisor
- Checks for best practices
- Checks Accounts and reports back
- Basic and Developer checks only get 6 security checks
- Business and Enterprise plans Get all no restrictions.

### Example Leveraging AWS Trusted Advisor
- [Trusted Advisor Terraform](Template)
- [Trusted Advisor aws cli](Template)

## AWS GuardDuty
- Security Monitoring Tools
- AWS Version manged by IDS
- Analyzes and process a variety of data.
- Intelligence feeds to proactively identity and alerts.
- Monitors both AWS resources and Accounts.

## Amazon Inspector
- Checks Network and accessability
- Checks Application exposure and Vulnerabilities.
- Gives a Detail Report.

## AWS Config

* Records Configuration change history on resources.
* Allows for audits and compliance checks.
* Exists per region
  - Cross-region recording
  - Aggregate recording
* Works with SNS to trigger events
* Evaluates rules when changes are recorded.
* Detailed view of configurations AWS Resources.
* Works with most AWS services.
* Config managed rules and custom for desired state.
* Ability to aggregate recorder data across accounts and regions.

### Example Code for Enabling AWS Config
- [AWS Config Terraform](Template)
- [AWS Config aws cli](Template)

## AWS Control Tower
- Multi Account creation with a Org
- Does the Account provisioning and deployment configuration.
- Account Factory, Landing Zone and GuardRails.
