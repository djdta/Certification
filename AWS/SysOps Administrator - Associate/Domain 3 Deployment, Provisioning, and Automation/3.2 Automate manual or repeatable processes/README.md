## 3.2 Automate manual or repeatable processes

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


AWs Systems Manager
Patching Management
Application Lifecyle
Parameters Stores

Code Commit
CodeBuild
CodeDeploy
Code Pipeline

## AWS CodeBuild
Code building (and testing) as a service
Billed for the underlying resources used during builds
Docker build environments
Tightly integrates with other AWS Services
Leverages 'buildspec.yml' for customizations

### Four Phases:
Install
Pre Build
Build
Post Build

## AWS CodeDeploy - Concepts

* Only deploys the code and does not deploy AWS Resources.
* Variety of uses including: Code, Web/Config Files, EXE, Scripts
* Tightly integrates with other AWS services, especially AWS Code*
* EC@ and On-prem utilize the AWS CodeDeploy Agent.
* Appspec.yml used to configure deployments.

## Appsec.yml Lifecycle Events
* ApplicationStop
* DownloadBundle
* BeforeInstall
* Install
* Afterinstall
* ApplicationStart
* ValidateService

appsec.yml

```
version: 0.0
os: linux
files:
    - source: /index.html
      destination: /var/www/html
hooks:
    BeforeInstall:
    - location: scripts/install_dependencies
        timeout: 300
        runas: root
    - location: scripts/stop_server
        timeout: 300
        runas:  root
    ApplicationStop:
    - location: scripts/stop_server
        timeout: 300
        runas: root
```

## AWS Codepipeline
* Continue Delivery (CD) service
* Controls process from source to deployment.
* Steps are separated as Stages
* Stage perform actions: Single, Parallel, Sequential.
* Ability to load artifacts and create artifacts.
* Allows for manual approvals where required.

## AWS Cloud Formation

* Template files are json or yml
* Stacks Grouping of related resources as one unit.
* Change Sets: Summary of proposed updates to a stack.
* Nested Stacks: Stacks that are contained within a parent stack
* Cross-Stack Reference: Referring to exported resources in another stack
* StackSets: Stacks that live across multiple accounts using the same template.

## Other
* Covered Elastic Beanstalk architecture and concepts.
* When to use AWS OpsWorks (Managed Puppet or Chef).
* CodeCommit for version control, Codebuild for builds and tests.  CodeDeploy for deployments, and Codepipeline to orchestrate.
* What cloudformation accomplishes (Infrastructure as Code).
* Important CloudFormation concepts like StackSets, Nested Stacks and Intrinsic Functions.