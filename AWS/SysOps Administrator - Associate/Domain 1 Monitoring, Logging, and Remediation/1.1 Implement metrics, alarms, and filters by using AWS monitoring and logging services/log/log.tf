resource "aws_cloudwatch_log_group" "webserver" {
  name  = "Yada"

  tags = {
    Environment = "production"
    Application = "WebServers"
  }
}

resource "aws_cloudwatch_log_metric_filter" "a" {
  name           = "202"
  pattern        = ""
  log_group_name = aws_cloudwatch_log_group.webserver.name

  metric_transformation {
    name      = "EventCount"
    namespace = "YourNamespace"
    value     = "1"
  }
}

resource "aws_cloudwatch_log_metric_filter" "b" {
  name           = "404"
  pattern        = ""
  log_group_name = aws_cloudwatch_log_group.webservers

  metric_transformation {
    name      = "EventCount"
    namespace = "YourNamespace"
    value     = "1"
  }
}

## Elasticsearch Log Publishing
# data "aws_iam_policy_document" "elasticsearch-log-publishing-policy" {
#   statement {
#     actions = [
#       "logs:CreateLogStream",
#       "logs:PutLogEvents",
#       "logs:PutLogEventsBatch",
#     ]

#     resources = ["arn:aws:logs:*"]

#     principals {
#       identifiers = ["es.amazonaws.com"]
#       type        = "Service"
#     }
#   }
# }

# resource "aws_cloudwatch_log_resource_policy" "elasticsearch-log-publishing-policy" {
#   count           = var.Elasticsearch_Log_Publishing == true ? 1 : 0
#   policy_document = data.aws_iam_policy_document.elasticsearch-log-publishing-policy.json
#   policy_name     = "elasticsearch-log-publishing-policy"
# }

## Route53 Query Logging
# data "aws_iam_policy_document" "route53-query-logging-policy" {
#   statement {
#     actions = [
#       "logs:CreateLogStream",
#       "logs:PutLogEvents",
# ]

# resources = ["arn:aws:logs:*:*:log-group:/aws/route53/*"]

# principals {
# identifiers = ["route53.amazonaws.com"]
# type        = "Service"
# }
#   }
# }

# resource "aws_cloudwatch_log_resource_policy" "route53-query-logging-policy" {
#   count           = var.Route_53_log == true ? 1 : 0
#   policy_document = data.aws_iam_policy_document.route53-query-logging-policy.json
#   policy_name     = "route53-query-logging-policy"
# }

# resource "aws_cloudwatch_metric_alarm" "foobar" {
#   alarm_name                = "terraform-test-foobar5"
#   comparison_operator       = "GreaterThanOrEqualToThreshold"
#   evaluation_periods        = "2"
#   metric_name               = "CPUUtilization"
#   namespace                 = "AWS/EC2"
#   period                    = "120"
#   statistic                 = "Average"
#   threshold                 = "80"
#   alarm_description         = "This metric monitors ec2 cpu utilization"
#   insufficient_data_actions = []
# }

## Example in Conjunction with Scaling Policies
# resource "aws_autoscaling_policy" "bat" {
#   name                   = "foobar3-terraform-test"
#   scaling_adjustment     = 4
#   adjustment_type        = "ChangeInCapacity"
#   cooldown               = 300
#   autoscaling_group_name = aws_autoscaling_group.bar.name
# }

# resource "aws_cloudwatch_metric_alarm" "bat" {
#   alarm_name          = "terraform-test-foobar5"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "2"
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = "120"
#   statistic           = "Average"
#   threshold           = "80"

#   dimensions = {
# AutoScalingGroupName = aws_autoscaling_group.bar.name
#   }

#   alarm_description = "This metric monitors ec2 cpu utilization"
#   alarm_actions     = [aws_autoscaling_policy.bat.arn]
# }
