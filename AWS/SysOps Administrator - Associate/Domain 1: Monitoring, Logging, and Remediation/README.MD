# Monitoring and Reporting

### Explorer
AWS Systems Manager Explorer is a customizable dashboard, providing key insights and analysis into the operational health and performance of your AWS environment. Explorer aggregates operational data from across AWS accounts and AWS Regions to help you prioritize and identify where action may be required.

### OpsCenter
OpsCenter provides a central location where operations engineers and IT professionals can view, investigate, and resolve operational issues related to any AWS resource:

* Event, resource and account details
* Past OpsItems with similar characteristics
* Related AWS Config changes
* AWS CloudTrail logs
* Amazon CloudWatch alarms
* Stack information
* Other quick-links to access logs and metrics
* List of runbooks and recommended runbooks
* Other information passed to OpsCenter through AWS services

This information helps engineers to investigate and remediate operational issues faster. Engineers can use OpsCenter to view and address issues using the Systems Manager console or via the Systems Manager OpsCenter APIs.

### Application Manager
* AWS Systems Manager Application Manager helps you investigate and remediate issues with your AWS resources in the context of your applications. 
* Application Manager can discover and/or define your application components, view operations data (e.g. deployment status, Amazon CloudWatch alarms, resource configurations, and operational issues) in the context of an application, and perform remedial actions such as patching and running Automation runbooks. This streamlines operational workflows for your applications, avoiding the need to use different consoles to investigate and remediate operational issues. 

* Application Manager to view operational data and CloudWatch alarms and take action on your existing container clusters in Amazon EKS environments.

### AppConfig
AWS AppConfig helps you deploy application configuration in a managed and a monitored way just like code deployments, but without the need to deploy the code if a configuration value changes. AWS AppConfig scales with your infrastructure so you can deploy configurations to any number of Amazon EC2 instances, containers, AWS Lambda functions, mobile apps, IoT devices or on-premises instances. AWS AppConfig enables you to update configurations by entering changes through the API or Console. AWS AppConfig allows you to validate those changes semantically and syntactically to ensure configurations are aligned to their respective applications’ expectation, thus enabling you to help prevent potential outages. You can deploy your application configurations with similar best practices as code deployments, including staging roll-outs, monitoring alarms, and roll back changes should an error occur.

### Parameter Store
AWS Systems Manager provides a centralized store to manage your configuration data, whether plain-text data such as database strings or secrets such as passwords. This allows you to separate your secrets and configuration data from your code. Parameters can be tagged and organized into hierarchies, helping you manage parameters more easily. For example, you can use the same parameter name, "db-string", with a different hierarchical path, "dev/db-string” or “prod/db-string", to store different values. Systems Manager is integrated with AWS Key Management Service (KMS), allowing you to automatically encrypt the data you store. You can also control user and resource access to parameters using AWS Identity and Access Management (IAM). Parameters can be referenced through other AWS services, such as Amazon Elastic Container Service, AWS Lambda, and AWS CloudFormation.

### Change Manager
AWS Systems Manager Change Manager simplifies the way you request, approve, implement, and report on operational changes to your application configuration and infrastructure on AWS and on-premises. With Change Manager, you can use pre-approved change workflows to help avoid unintentional results when making operational changes. Change Manager helps you safely implement changes, while detecting schedule conflicts with important business events and automatically notifying impacted approvers. Using Change Manager’s change reports, you can monitor progress and audit operational changes across your organization, providing improved visibility and accountability.

### Automation
AWS Systems Manager allows you to safely automate common and repetitive IT operations and management tasks. With Systems Manager Automation, you can use predefined playbooks, or you can build, run, and share wiki-style automated playbooks to enable AWS resource management across multiple accounts and AWS Regions. You can execute Python or PowerShell scripts as part of a playbook in combination with other automation actions such as approvals, AWS API calls, or running commands on your EC2 instances. These playbooks can be scheduled in a maintenance window, triggered based on changes to AWS resources through Amazon CloudWatch Events, or executed directly through the AWS Management Console, CLIs, and SDKs. You can track the execution of each step in a playbook, require approvals, incrementally roll out changes, and automatically halt the roll out if errors occur.

### Maintenance Windows
AWS Systems Manager lets you schedule windows of time to run administrative and maintenance tasks across your instances. This ensures that you can select a convenient and safe time to install patches and updates or make other configuration changes, improving the availability and reliability of your services and applications.

### Fleet Manager
AWS Systems Manager Fleet Manager streamlines your remote server management process. With Fleet Manager, you can easily manage and troubleshoot your fleet of servers running on AWS and on-premises. You can drill down to individual servers to perform common troubleshooting and management tasks using a centralized graphical user interface. Perform a variety of system administration tasks, including disk and file exploration, log management, Windows Registry operations, and user management, without needing to remotely connect to your virtual machines, saving your administrators time and effort.

### Compliance
AWS Systems Manager automatically aggregates and displays operational data for each resource group through a dashboard. Systems Manager eliminates the need for you to navigate across multiple AWS consoles to view your operational data. With Systems Manager you can view API call logs from AWS CloudTrail, resource configuration changes from AWS Config, software inventory, and patch compliance status by resource group. You can also easily integrate your AWS CloudWatch Dashboards, AWS Trusted Advisor notifications, and AWS Personal Health Dashboard performance and availability alerts into your Systems Manager dashboard. Systems Manager centralizes all relevant operational data, so you can have a clear view of your infrastructure compliance and performance.

### Compliance dashboard
Inventory
AWS Systems Manager collects information about your instances and the software installed on them, helping you to understand your system configurations and installed applications. You can collect data about applications, files, network configurations, Windows services, registries, server roles, updates, and any other system properties. The gathered data enables you to manage application assets, track licenses, monitor file integrity, discover applications not installed by a traditional installer, and more.

### AWS Systems Manager Inventory
Session Manager
AWS Systems Manager provides a browser-based interactive shell and CLI for managing Windows and Linux EC2 instances, without the need to open inbound ports, manage SSH keys, or use bastion hosts. Administrators can grant and revoke access to instances through a central location by using AWS Identity and Access Management (IAM) policies. This allows you to control which users can access each instance, including the option to provide non-root access to specified users. Once access is provided, you can audit which user accessed an instance and log each command to Amazon S3 or Amazon Cloud Watch Logs using AWS CloudTrail.

### Run Command
AWS Systems Manager provides you safe, secure remote management of your instances at scale without logging into your servers, replacing the need for bastion hosts, SSH, or remote PowerShell. It provides a simple way of automating common administrative tasks across groups of instances such as registry edits, user management, and software and patch installations. Through integration with AWS Identity and Access Management (IAM), you can apply granular permissions to control the actions users can perform on instances. All actions taken with Systems Manager are recorded by AWS CloudTrail, allowing you to audit changes throughout your environment.

### State Manager
AWS Systems Manager provides configuration management, which helps you maintain consistent configuration of your Amazon EC2 or on-premises instances. With Systems Manager, you can control configuration details such as server configurations, anti-virus definitions, firewall settings, and more. You can define configuration policies for your servers through the AWS Management Console or use existing scripts, PowerShell modules, or Ansible playbooks directly from GitHub or Amazon S3 buckets. Systems Manager automatically applies your configurations across your instances at a time and frequency that you define. You can query Systems Manager at any time to view the status of your instance configurations, giving you on-demand visibility into your compliance status.

### Patch Manager
AWS Systems Manager helps you select and deploy operating system and software patches automatically across large groups of Amazon EC2 or on-premises instances. Through patch baselines, you can set rules to auto-approve select categories of patches to be installed, such as operating system or high severity patches, and you can specify a list of patches that override these rules and are automatically approved or rejected. You can also schedule maintenance windows for your patches so that they are only applied during preset times. Systems Manager helps ensure that your software is up-to-date and meets your compliance policies.

### Distributor
AWS Systems Manager helps you securely distribute and install software packages, such as software agents. Systems Manager Distributor allows you to centrally store and systematically distribute software packages while you maintain control over versioning. You can use Distributor to create and distribute software packages and then install them using Systems Manager Run Command and State Manager. Distributor can also use Identity and Access Management (IAM) policies to control who can create or update packages in your account. You can use the existing IAM policy support for Systems Manager Run Command and State Manager to define who can install packages on your hosts.
Connect with ITSM / ITOM Software

IT Service Management (ITSM) tools, such as Jira Service Desk, can connect with AWS Systems Manager to make it easier for ITSM platform users to manage AWS resources. These AWS Service Management Connectors provide Jira Service Desk administrators governance and oversight over AWS products.