## Cert Manager
resource "aws_acm_certificate" "cert" {
  domain_name       = "example.com"
  validation_method = "DNS"

  tags = {
    Environment = "test"
  }

  lifecycle {
    create_before_destroy = true
  }
}

## Secerts Manager
resource "aws_secretsmanager_secret" "example" {
  name = "example"
}

## AWS Config with AWS inspect
# Declare the data source
data "aws_inspector_rules_packages" "rules" {}

# e.g., Use in aws_inspector_assessment_template
resource "aws_inspector_resource_group" "group" {
  tags = {
    test = "test"
  }
}

resource "aws_inspector_assessment_target" "assessment" {
  name               = "test"
  resource_group_arn = aws_inspector_resource_group.group.arn
}

resource "aws_inspector_assessment_template" "assessment" {
  name       = "Test"
  target_arn = aws_inspector_assessment_target.assessment.arn
  duration   = "60"

  rules_package_arns = data.aws_inspector_rules_packages.rules.arns
}