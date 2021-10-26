## Template

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