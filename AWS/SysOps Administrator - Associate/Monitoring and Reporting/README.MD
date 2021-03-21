# Monitoring and Reporting

Summary


### AWS System Manager

1.0 Explorer

---

AWS Systems Manager Explorer is a customizable operations dashboard that reports information about
your AWS resources. Explorer displays an aggregated view of operations data (OpsData) for your AWS
accounts and across Regions. In Explorer, OpsData includes metadata about your EC2 instances, patch
compliance details, and State Manager association compliance details. OpsData also includes information
from supporting AWS services like AWS Trusted Advisor, AWS Compute Optimizer, and information about
your AWS Support cases.

To raise operational awarness, Explorer also displays operational work items (OpsItems). Explorer
provides context about how OpsItems are distributed across your business units or applications, how
they trend over time, and how they vary by category. You can group and filter information in Explorer to
focus on items that are relevant to you and that require action. When you identify high priority issues,
you can use Systems Manager OpsCenter to run Automation runbooks and quickly resolve those issues.
The following image shows some of the individual report boxes, called widgets, which are available in
Explorer.


1.1 OpsCenter

---

OpsCenter provides a central location where operations engineers and IT professionals can view, investigate, and resolve operational work items (OpsItems) related to AWS resources. OpsCenter is designed to reduce mean time to resolution for issues impacting AWS resources. This Systems Manager capability aggregates and standardizes OpsItems across services while providing contextual investigation data about each OpsItem, related OpsItems, and related resources. OpsCenter also provides Systems Manager Automation documents (runbooks) that you can use to quickly resolve issues. You can specify searchable, custom data for each OpsItem. You can also view automatically-generated summary reports about OpsItems by status and source.

OpsCenter is integrated with Amazon EventBridge and Amazon CloudWatch. This means you can configure these services to automatically create an OpsItem in OpsCenter when a CloudWatch alarm enters the ALARM state or when EventBridge processes an event from any AWS service that publishes
events. Configuring CloudWatch alarms and EventBridge events to automatically create OpsItems enables you to quickly diagnose and remediate issues with AWS resources from a single console. To help you diagnose issues, each OpsItem includes contextually relevant information such as the name and ID of the AWS resource that generated the OpsItem, alarm or event details, alarm history, and an alarm timeline graph. For the AWS resource, OpsCenter aggregates information from AWS Config, AWS CloudTrail logs, and Amazon CloudWatch Events, so you don't have to navigate across multiple console pages during your investigation. The following list includes types of AWS resources and metrics for which customers configured.

CloudWatch alarms that create OpsItems.
* Amazon DynamoDB: database read and write actions reach a threshold
* Amazon EC2: CPU utilization reaches a threshold
* AWS billing: estimated charges reach a threshold
* Amazon EC2: an instance fails a status check
* Amazon Elastic Block Store (EBS): disk space utilization reaches a threshol

1.2 Dashboard by CloudWatch

---

Amazon CloudWatch Dashboards are customizable home pages in the CloudWatch console that you can use to monitor your resources in a single view, even those resources that are spread across different Regions. You can use CloudWatch dashboards to create customized views of the metrics and alarms for your AWS resources. With dashboards, you can create the following:

* A single view for selected metrics and alarms to help you assess the health of your resources and applications across one or more Regions. You can select the color used for each metric on each graph, so that you can easily track the same metric across multiple graphs.

* An operational playbook that provides guidance for team members during operational events about how to respond to specific incidents.

* A common view of critical resource and application measurements that can be shared by team members for faster communication flow during operational events.

1.3 Personal Health Dashboard

## Application Management

2.0 Application Manager

---

Application Manager, a capability of AWS Systems Manager, helps DevOps engineers investigate and
remediate issues with their AWS resources in the context of their applications. Application Manager
aggregates operations information from multiple AWS services and Systems Manager capabilities to a
single AWS Management Console.

In Application Manager, an application is a logical group of AWS resources that you want to operate as
a unit. This logical group can represent different versions of an application, ownership boundaries for
operators, or developer environments, to name a few.
When you choose Get started on the Application Manager home page, Application Manager
automatically imports metadata about your resources that were created in other AWS services or
Systems Manager capabilities. Specifically, Application Manager imports metadata about all of your
AWS resources organized into resource groups. 

Each resource group is listed in the Custom applications
category as a unique application. Application Manager also automatically imports metadata about
resources that were created by AWS CloudFormation, Amazon Elastic Kubernetes Service (Amazon EKS),
and AWS Launch Wizard. Application Manager then displays those resources in the following predefined
application categories:

* Custom applications
* CloudFormation stacks
* EKS clusters
* Launch Wizard

After import completes, you can view operations information about your resources in these predefined
application categories. Or, if you want to provide more context about a collection of resources, you can
manually create an application in Application Manager and move resources or groups of resources into
that application. This enables you to view operations information in the context of an application.
After you set up and configure AWS services and Systems Manager capabilities, Application Manager

displays the following types of information about your resources:
* Alarms provided by Amazon CloudWatch
* Compliance information provided by AWS Config and Systems Manager State Manager

AppConfig

Use AWS AppConfig, a capability of AWS Systems Manager, to create, manage, and quickly deploy
application configurations. AWS AppConfig supports controlled deployments to applications of any size
and includes built-in validation checks and monitoring. You can use AWS AppConfig with applications
hosted on EC2 instances, AWS Lambda, containers, mobile applications, or IoT devices.
Information about AWS AppConfig has been moved into a separate user guide. For more information,
see What Is AWS AppConfig?

Parameter Store

AWS Systems Manager Parameter Store (Parameter Store) provides secure, hierarchical storage for
configuration data management and secrets management. You can store data such as passwords,
database strings, Amazon Machine Image (AMI) IDs, and license codes as parameter values. You can store
values as plain text or encrypted data. You can reference Systems Manager parameters in your scripts,
commands, SSM documents, and configuration and automation workflows by using the unique name
that you specified when you created the parameter.

Note:
To implement password rotation lifecycles, use AWS Secrets Manager. Secrets Manager allows
you to easily rotate, manage, and retrieve database credentials, API keys, and other secrets
throughout their lifecycle. For more information, see What is AWS Secrets Manager? in the AWS
Secrets Manager Userguide.

* Change notification
You can configure change notifications and trigger automated actions for both parameters and
parameter policies.

* Organize and control access
You can tag your parameters individually to help you quickly identify one or more parameters based
on the tags you've assigned to them. For example, you can tag parameters for specific environments,
departments, users, groups, or periods. You can also restrict access to parameters by creating an AWS
Identity and Access Management (IAM) policy that specifies the tags that a user or group can access.

* Label versions
You can associate an alias for versions of your parameter by creating labels. Labels can help you
remember the purpose of a parameter version when there are multiple versions.

* Data validation
You can create parameters that point to an Amazon Elastic Compute Cloud (Amazon EC2) instance and
Parameter Store will validate these parameters to ensure that it references expected resource type,
that the resource exists, and that the customer has permission to use the resource. For example, you
can create a parameter with Amazon Machine Image (AMI) ID as a value with aws:ec2:image data type,
and Parameter Store performs an asynchronous validation operation to ensure that the parameter
value meets the formatting requirements for an AMI ID, and that the specified AMI is available in your
AWS account.

* Reference secrets
Parameter Store is integrated with AWS Secrets Manager so that you can retrieve Secrets Manager
secrets when using other AWS services that already support references to Parameter Store parameters.

* Accessible from other AWS services
You can use Parameter Store parameters with other Systems Manager capabilities and AWS services to
retrieve secrets and configuration data from a central store. Parameters work with Systems Manager
capabilities such as AWS Systems Manager Run Command (Run Command), AWS Systems Manager
State Manager (State Manager), and AWS Systems Manager Automation (Automation). 
You can also reference parameters in a number of other AWS services, including the following:

* Amazon Elastic Compute Cloud (Amazon EC2)
* Amazon Elastic Container Service (Amazon ECS)
* AWS Secrets Manager (Secrets Manager)
* AWS Lambda (Lambda)
* AWS CloudFormation (CloudFormation)
* AWS CodeBuild (CodeBuild)
* AWS CodePipeline (CodePipeline)
* AWS CodeDeploy (CodeDeploy)
* Integrate with other AWS services
Configure integration with the following AWS services for encryption, notification, monitoring, and
auditing:

* AWS Key Management Service (AWS KMS)
* Amazon Simple Notification Service (Amazon SNS)
* Amazon CloudWatch (CloudWatch)
* Amazon EventBridge (EventBridge):
* AWS CloudTrail (CloudTrail)

Setting up Parameter Store
Before setting up parameters in AWS Systems Manager Parameter Store (Parameter Store), you must
first configure AWS Identity and Access Management (IAM) policies that provide users in your account
with permission to perform the actions you specify. This section includes information about how to
manually configure these policies using the IAM console, and how to assign them to users and user
groups. You can also create and assign policies to control which parameter actions can be run on an
instance. This section also includes information about how to create Amazon EventBridge (EventBridge)
rules that let you receive notifications about changes to Systems Manager parameters. You can also use
EventBridge rules to trigger other actions in AWS based on changes in Parameter Store.

Restricting access to Systems Manager parameters using IAM policies

You restrict access to AWS Systems Manager parameters by using AWS Identity and Access Management
(IAM). More specifically, you create IAM policies that restrict access to the following API operations:

* DeleteParameter
* DeleteParameters
* DescribeParameters
* GetParameter
* GetParameters
* GetParameterHistory
* GetParametersByPath
* PutParameter

When using IAM policies to restrict access to Systems Manager parameters, we recommend that you
create and use restrictive IAM policies. For example, the following policy allows a user to call the
DescribeParameters and GetParameters API operations for a limited set of resources. This means
that the user can get information about and use all parameters that begin with prod-*.

```
{
"Version": "2012-10-17",
"Statement": [
{

"Effect": "Allow",
"Action": [
        "ssm:DescribeParameters"
],
        "Resource": "*"
    },
{
"Effect": "Allow",
    "Action": [
        "ssm:GetParameters"
],
"Resource": "arn:aws:ssm:us-east-2:123456789012:parameter/prod-*"
        }
    ]
}
```

Important
If a user has access to a path, then the user can access all levels of that path. For example,
if a user has permission to access path /a, then the user can also access /a/b. Even if a
user has explicitly been denied access in IAM for parameter /a/b, they can still call the
GetParametersByPath API action recursively for /a and view /a/b.

For trusted administrators, you can provide access to all Systems Manager parameter API operations by
using a policy similar to the following example. This policy gives the user full access to all production
parameters that begin with dbserver-prod-*.

```
{
"Version": "2012-10-17",
"Statement": [
{
"Sid": "VisualEditor0",
    "Effect": "Allow",
        "Action": [
            "ssm:PutParameter",
            "ssm:DeleteParameter",
            "ssm:GetParameterHistory",
            "ssm:GetParametersByPath",
            "ssm:GetParameters",
            "ssm:GetParameter",
            "ssm:DeleteParameters"
],
            "Resource": "arn:aws:ssm:region:account-id:parameter/dbserver-prod-*"
        },
    {
"Sid": "VisualEditor1",
"Effect": "Allow",
"Action": "ssm:DescribeParameters",
"Resource": "*"
        }
    ]
}
```

Deny permissions
Each API is unique and has distinct operations and permissions that you can allow or deny individually.
An explicit deny in any policy overrides the allow.

Note
The default AWS Key Management Service (AWS KMS) key has Decrypt permission for all IAM
principals within the AWS account. If you want to have different access levels to SecureString
parameters in your account, we do not recommend that you use the default key.
If you want all API operations retrieving parameter values to have the same behavior, then you can use
a pattern like GetParameter* in a policy. The following example shows how to deny GetParameter, GetParameters, GetParameterHistory, and GetParametersByPath for all parameters beginning
with prod-*.

```
{
"Version": "2012-10-17",
"Statement": [
{
    "Effect": "Deny",
        "Action": [
        "ssm:GetParameter*"
    ],
    "Resource": "arn:aws:ssm:us-east-2:123456789012:parameter/prod-*"
        }
    ]
}
```

The following example shows how to deny some commands while allowing the user to perform other
commands on all parameters that begin with prod-*.

```
{
"Version": "2012-10-17",
"Statement": [
"Effect": "Deny",
"Action": [
"ssm:PutParameter",
"ssm:DeleteParameter",
"ssm:DeleteParameters"
],
"Resource": "*"
},
{
"Effect": "Allow",
"Action": [
"ssm:GetParametersByPath",
"ssm:GetParameters",
"ssm:GetParameter",
"ssm:GetParameterHistory"
"ssm:DescribeParameters"
],
"Resource": "arn:aws:ssm:region:account-id:parameter/prod-*"
}
]
}
```

Note
The parameter history includes all parameter versions, including the current one. Therefore, if
a user is denied permission for GetParameter, GetParameters, and GetParameterByPath
but is allowed permission for GetParameterHistory, they can see the current parameter,
including SecureString parameters, using GetParameterHistory.

Allowing only specific parameters to run on instances
You can control access so that instances can run only parameters that you specify.
If you choose the SecureString parameter type when you create your parameter, Systems Manager
uses AWS KMS to encrypt the parameter value. AWS KMS encrypts the value by using either an AWS
managed customer master key (CMK) or a customer managed CMK. For more information about AWS
KMS and CMKs, see the AWS Key Management Service Developer Guide.
You can view the AWS managed CMK by running the following command from the AWS CLI.

```
aws kms describe-key --key-id alias/aws/ssm
```
The following example enables instances to get a parameter value only for parameters that begin with
prod-. If the parameter is a SecureString parameter, then the instance decrypts the string using AWS
KMS.

Note
Instance policies, like in the following example, are assigned to the instance role in IAM. For
more information about configuring access to Systems Manager features, including how to
assign policies to users and instances, see Setting up AWS Systems Manager (p. 28).

```
{
"Version":"2012-10-17",
"Statement":[
{
"Effect":"Allow",
"Action":[
"ssm:GetParameters"
],
"Resource":[
"arn:aws:ssm:region:account-id:parameter/prod-*"
]
},
{
"Effect":"Allow",
"Action":[
"kms:Decrypt"
],
"Resource":[
"arn:aws:kms:region:account-id:key/CMK"
]
}
]
}
```
IAM permissions for using AWS default keys and customer managed keys
AWS Systems Manager Parameter Store (Parameter Store) SecureString parameters are encrypted
and decrypted using AWS KMS keys. You can choose to encrypt your SecureString parameters using
either a customer master key (CMK) or the default KMS key provided by AWS.
When using a customer managed key, the IAM policy that grants a user access to a parameter or
parameter path must provide explicit kms:Encrypt permissions for the key. For example, the following
policy allows a user to create, update, and view SecureString parameters that begin with prod- in the
specified AWS Region and account.

```
{
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Allow",
"Action": [
"ssm:PutParameter",
"ssm:GetParameter",
"ssm:GetParameters"
],
"Resource": [
"arn:aws:ssm:us-east-2:111122223333:parameter/prod-*"
]
},
{
"Effect": "Allow",
"Action": [
"kms:Decrypt",
"kms:Encrypt",
"kms:GenerateDataKey"
],
"Resource": [
"arn:aws:kms:useast-
2:111122223333:key/1234abcd-12ab-34cd-56ef-12345EXAMPLE"
]
}
]
}
```

1The kms:GenerateDataKey permission is required for creating encrypted advanced parameters using
the specified customer managed key.
By contrast, all users within the customer account have access to the default AWS managed key. If
you use this default key to encrypt SecureString parameters and do not want users to work with
SecureString parameters, their IAM policies must explicitly deny access to the default key, as
demonstrated in the following policy example.

Note
You can locate the Amazon Resource Name (ARN) of the default key in the AWS KMS console on
the AWS managed keys page. The default key is the one identified with aws/ssm in the Alias
column.

```
{
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Deny",
"Action": [
"kms:Decrypt",
"kms:GenerateDataKey "
],
"Resource": [
"default-key-ARN"
]
}
]
}
```
If you require fine-grained access control over the SecureString parameters in your account, you
should use a customer managed CMK to protect and restrict access to these parameters. We also
recommend using AWS CloudTrail (CloudTrail) to monitor SecureString parameter activities.

Managing parameter tiers
AWS Systems Manager Parameter Store (Parameter Store) includes standard parameters and advanced
parameters. You individually configure parameters to use either the standard-parameter tier (the default
tier) or the advanced-parameter tier.
249
AWS Systems Manager User Guide
Setting up Parameter Store
You can change a standard parameter to an advanced parameter at any time, but you can’t revert an
advanced parameter to a standard parameter. Reverting an advanced parameter to a standard parameter
would result in data loss because the system would truncate the size of the parameter from 8 KB to 4
KB. Reverting would also remove any policies attached to the parameter. Also, advanced parameters use
a different form of encryption than standard parameters. For more information, see How AWS Systems
Manager Parameter Store Uses AWS KMS in the AWS Key Management Service Developer Guide.
If you no longer need an advanced parameter, or if you no longer want to incur charges for an advanced
parameter, you must delete it and recreate it as a new standard parameter.
The following table describes the differences between the tiers.

| Column 1       | Standard     | Advanced     |
| :------------- | :----------: | -----------: |
| Total number of parameters allowed (per AWS account and Region) | 10,000  | 100,000    |
| Maximum size of a parameter value   | 4 KB | 8 KB |
| Parameter policies available | No | Yes |
| Cost | No additional charge | Charges apply |

Specifying a default parameter tier

In requests to create or update a parameter (that is, the PutParameter action), you can specify the
parameter tier to use in the request. The following is an example, using the AWS Command Line
Interface (AWS CLI).

```
aws ssm put-parameter \
--name "default-ami" \
--type "String" \
--value "t2.micro" \
--tier "Standard"
```

Whenever you specify a tier in the request, Parameter Store creates or updates the parameter according
to your request. However, if you do not explicitly specify a tier in a request, the Parameter Store default
tier setting determines which tier the parameter is created in.
The default tier when you begin using Parameter Store is the standard-parameter tier. If you use the
advanced-parameter tier, you can specify one of the following as the default:

• Advanced: With this option, Parameter Store evaluates all requests as advanced parameters.
• Intelligent-Tiering: With this option, Parameter Store evaluates each request to determine if the
parameter is standard or advanced.
If the request doesn't include any options that require an advanced parameter, the parameter is
created in the standard-parameter tier. If one or more options requiring an advanced parameter are
included in the request, Parameter Store creates a parameter in the advanced-parameter tier.

Benefits of Intelligent-Tiering
The following are reasons you might choose Intelligent-Tiering as the default tier.
Cost control – Intelligent-Tiering helps control your parameter-related costs by always creating standard
parameters unless an advanced parameter is absolutely necessary.
Automatic upgrade to the advanced-parameter tier – When you make a change to your code that
requires upgrading a standard parameter to an advanced parameter, Intelligent-Tiering handles the
conversion for you. You do not need to change your code to handle the upgrade.
Here are some examples of automatic upgrade:

Your AWS CloudFormation (CloudFormation) templates provision numerous parameters when they
are run. When this process causes you to reach the 10,000 parameter limit in the standard-parameter
tier, Intelligent-Tiering automatically upgrades you to the advanced-parameter tier, and your AWS
CloudFormation processes are not interrupted.

* You store a certificate value in a parameter, rotate the certificate value regularly, and the content is
less than the 4 KB limit of the standard-parameter tier. If a replacement certificate value exceeds 4 KB,
Intelligent-Tiering automatically upgrades the parameter to the advanced-parameter tier.

* You want to associate numerous existing standard parameters to a parameter policy, which requires
the advanced-parameter tier. Instead of your having to include the option --tier Advanced in all
of the calls to update the parameters, Intelligent-Tiering automatically upgrades the parameters to
the advanced-parameter tier. The Intelligent-Tiering option upgrades parameters from standard to
advanced whenever criteria for the advanced-parameter tier are introduced.

Options that require an advanced parameter include the following:
* The content size of the parameter is more than 4 KB.
* The parameter uses a parameter policy.
* More than 10,000 parameters already exist in your AWS account in the current Region.

Default Tier Options
The tier options you can specify as the default include the following.

* Standard – The standard-parameter tier is the default tier when you begin to use Parameter Store.
Using the standard-parameter tier, you can create 10,000 parameters for each Region in an AWS
account. The content size of each parameter can equal a maximum of 4 KB. Standard parameters
do not support parameter policies. There is no additional charge to use the standard-parameter
tier. Choosing Standard as the default tier means that Parameter Store always attempts to create a
standard parameter for requests that don't specify a tier.

* Advanced – The advanced-parameter tier lets you create a maximum of 100,000 parameters for
each Region in an AWS account. The content size of each parameter can equal a maximum of 8 KB.
Advanced parameters support parameter policies. There is a charge to use the advanced-parameter
tier. For more information, see AWS Systems Manager Pricing. Choosing Advanced as the default tier
means that Parameter Store always attempts to create an advanced parameter for requests that don't
specify a tier.

## Change Management
Change Manager
Automation
Change Calendar
Maintenance Windows

## Node Management
Fleet Manager
Compliance
Inventory
Managed Instances
Hybrid Activations
Session Manager
Run Command
State Manager
Patch Manager
Distributor

## Shared Resources
Documents