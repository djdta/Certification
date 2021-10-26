# 3.1 Provision and maintain cloud resources

Elastic Beanstalks
* Serverd as a Platform as a Service for the developers for use.
* AWS  orchestrates application and environments using your code
* Allows users to focus on coding: Infrastructure is handled by AWS
* Pay only for the AWS service.
* Pay only for the AWS services on the backend that EB uses
swap urls

* Applications with Application Versions
* Environments and Environment Tiers
* Environments Configurations
* Platforms
* Elastic Beanstalk HTTP Web Server or Worker.

## AWS OpsWorks
* Puppet
* Chef
* OpsWorks
* Stacks represents a set of instance with common purpose.
* Every Stack has one or more layers that represent a component.
* Instances can be 24/7, Tim-based or Load-based.
* App represent your code that you want to deploy into AWS.
* Used to deploy Chef Cookbooks or Puppet Recipes.

## AWS System Manager

* System Manager (SSM) allow us to view and control AWS infrastructure.
* Leverages Managed Instances to configure and maintain compute compliance.
* Logical grouping is done via tags known as Resource Tags
* Contains several capabilities grouped into categories.
* Simplifies resource and applications management at scale.
* SSM leverages an SSM Agent
* Managed Inventory and Patches
* Allow for command executions.
* Store configurations and secrets data.

## AWS Systems Manager - Patch Manager

* Uses Patch Baselines to auto-approve or auto-reject patches.
* Leverage Maintenance Windows to define approved/denied times.
* Group instances using Patch Groups to assign to a patch baseline.
* View instances compliance status for all managed instances.
* All patch updates are executed using run command.
  
## Amazon EventBridge - Overview
* Serverless event bus that connects apps with data from source.
* Targets include: Lambda Functions, HTTP endpoints, API Gateways.
* Receives an Event, applies a Rule, and routes event to a Target.
* Event patterns or Scheduled  Events.

## Amazon S3 - Event Notifications

* S3 can generate notifications triggered by specified events.
* Variety of targets: SNS, SQS, Lambda
* Several predefined events by AWS for you to choose from
* Events are delivered in a "at least once" fashion.
* Create custom filters using key prefixes.

## AWS Config

* Records Configuration change history on resources.
* Allows for audits and compliance checks.
* Exists per region
  - Cross-region recording
  - Aggregate recording
* Works with SNS to trigger events
* Evaluates rules when changes are recorded.