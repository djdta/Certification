# Secuirty and Compliance

We all know that secuirty is a big part of how to secure

## IAM Users

* Users single unit which allows users to login.
* Users can have cli access without access to management console.
* Users with just managemant access does not have cli access.
* User can setup mfa USB or Phone.

#### Example Code

```resource "aws_iam_user" "lb" {
  name = "Test"
  path = "/"
  force_destroy = true 

  tags = {
    tag-key = "tag-value"
  }
}
```

## IAM Groups

* Groups can be used to seprate into functions i.e Administrator, Support Staff

##### Example Code

```resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/users/"
}
```

## IAM Policy

* Policy can be added to users and groups.
* Any Deny rules is the highest of approve.
* You can assign more than one policy to a user or group.

##### Example Code

```resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
```

# Shared Responsibility Model

When we talk about the shared responsibility model for any cloud provider they would have a smilar answer that all of the datacentres,hardware and networking is reailiably and secure.  When you start using the services on there platform of choice, then the user should be responsibility for the up keep of any resources deployed.

That said all major cloud providers would have the tools to help in finding these issues and reporting them to you.  Again the tools would be at a price per hour.

Below is a link i have found in regards to the Shared Responsibility Model which should help in understanding further this requirement.

[Shared Responsibility Model](https://www.cloudpassage.com/articles/shared-responsibility-model-explained/)
