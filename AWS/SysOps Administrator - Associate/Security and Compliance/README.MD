# Secuirty and Compliance

## IAM Users
---

* Users single unit which allows users to login
* Users can have cli access without access to management console.
* Users with just managemant access does not have cli access.

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
---

* Groups can be used to seprate into functions i.e Administrator, Support Staff

##### Example Code

```resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/users/"
}
```

## IAM Policy

---

* Policy can be added to users and groups.
* Any Deny rules is the highest of approve.
* You can assign more than one policy to a user or group

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
