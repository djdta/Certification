resource "aws_cloudwatch_log_destination" "test_destination" {
  name       = "test_destination"
  role_arn   = aws_iam_role.iam_for_cloudwatch.arn
  target_arn = aws_kinesis_stream.kinesis_for_cloudwatch.arn
}

resource "aws_cloudwatch_log_destination" "test_destination" {
  name       = "test_destination"
  role_arn   = aws_iam_role.iam_for_cloudwatch.arn
  target_arn = aws_kinesis_stream.kinesis_for_cloudwatch.arn
}

data "aws_iam_policy_document" "test_destination_policy" {
  statement {
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        "123456789012",
      ]
    }

    actions = [
      "logs:PutSubscriptionFilter",
    ]

    resources = [
      aws_cloudwatch_log_destination.test_destination.arn,
    ]
  }
}

resource "aws_cloudwatch_log_destination_policy" "test_destination_policy" {
  destination_name = aws_cloudwatch_log_destination.test_destination.name
  access_policy    = data.aws_iam_policy_document.test_destination_policy.json
}

resource "aws_cloudwatch_log_group" "yada" {
  name = "Yada"

  tags = {
    Environment = "production"
    Application = "serviceA"
  }
}

resource "aws_cloudwatch_log_metric_filter" "yada" {
  name           = "MyAppAccessCount"
  pattern        = ""
  log_group_name = aws_cloudwatch_log_group.dada.name

  metric_transformation {
    name      = "EventCount"
    namespace = "YourNamespace"
    value     = "1"
  }
}

resource "aws_cloudwatch_log_group" "dada" {
  name = "MyApp/access.log"
}

## Elasticsearch Log Publishing
data "aws_iam_policy_document" "elasticsearch-log-publishing-policy" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:PutLogEventsBatch",
    ]

    resources = ["arn:aws:logs:*"]

    principals {
      identifiers = ["es.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_cloudwatch_log_resource_policy" "elasticsearch-log-publishing-policy" {
  policy_document = data.aws_iam_policy_document.elasticsearch-log-publishing-policy.json
  policy_name     = "elasticsearch-log-publishing-policy"
}

## Route53 Query Logging
data "aws_iam_policy_document" "route53-query-logging-policy" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:*:*:log-group:/aws/route53/*"]

    principals {
      identifiers = ["route53.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_cloudwatch_log_resource_policy" "route53-query-logging-policy" {
  policy_document = data.aws_iam_policy_document.route53-query-logging-policy.json
  policy_name     = "route53-query-logging-policy"
}

resource "aws_cloudwatch_log_group" "yada" {
  name = "Yada"
}

resource "aws_cloudwatch_log_stream" "foo" {
  name           = "SampleLogStream1234"
  log_group_name = aws_cloudwatch_log_group.yada.name
}

resource "aws_cloudwatch_log_subscription_filter" "test_lambdafunction_logfilter" {
  name            = "test_lambdafunction_logfilter"
  role_arn        = aws_iam_role.iam_for_lambda.arn
  log_group_name  = "/aws/lambda/example_lambda_name"
  filter_pattern  = "logtype test"
  destination_arn = aws_kinesis_stream.test_logstream.arn
  distribution    = "Random"
}

resource "aws_cloudwatch_metric_alarm" "foobar" {
  alarm_name                = "terraform-test-foobar5"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
}

## Example in Conjunction with Scaling Policies
resource "aws_autoscaling_policy" "bat" {
  name                   = "foobar3-terraform-test"
  scaling_adjustment     = 4
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.bar.name
}

resource "aws_cloudwatch_metric_alarm" "bat" {
  alarm_name          = "terraform-test-foobar5"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.bar.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.bat.arn]
}

## Example with an Expression
resource "aws_cloudwatch_metric_alarm" "foobar" {
  alarm_name                = "terraform-test-foobar"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  threshold                 = "10"
  alarm_description         = "Request error rate has exceeded 10%"
  insufficient_data_actions = []

  metric_query {
    id          = "e1"
    expression  = "m2/m1*100"
    label       = "Error Rate"
    return_data = "true"
  }

  metric_query {
    id = "m1"

    metric {
      metric_name = "RequestCount"
      namespace   = "AWS/ApplicationELB"
      period      = "120"
      stat        = "Sum"
      unit        = "Count"

      dimensions = {
        LoadBalancer = "app/web"
      }
    }
  }

  metric_query {
    id = "m2"

    metric {
      metric_name = "HTTPCode_ELB_5XX_Count"
      namespace   = "AWS/ApplicationELB"
      period      = "120"
      stat        = "Sum"
      unit        = "Count"

      dimensions = {
        LoadBalancer = "app/web"
      }
    }
  }
}
resource "aws_cloudwatch_metric_alarm" "xx_anomaly_detection" {
  alarm_name                = "terraform-test-foobar"
  comparison_operator       = "GreaterThanUpperThreshold"
  evaluation_periods        = "2"
  threshold_metric_id       = "e1"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []

  metric_query {
    id          = "e1"
    expression  = "ANOMALY_DETECTION_BAND(m1)"
    label       = "CPUUtilization (Expected)"
    return_data = "true"
  }

  metric_query {
    id          = "m1"
    return_data = "true"
    metric {
      metric_name = "CPUUtilization"
      namespace   = "AWS/EC2"
      period      = "120"
      stat        = "Average"
      unit        = "Count"

      dimensions = {
        InstanceId = "i-abc123"
      }
    }
  }
}

## Example of monitoring Healthy Hosts on NLB using Target Group and NLB
resource "aws_cloudwatch_metric_alarm" "nlb_healthyhosts" {
  alarm_name          = "alarmname"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "HealthyHostCount"
  namespace           = "AWS/NetworkELB"
  period              = "60"
  statistic           = "Average"
  threshold           = var.logstash_servers_count
  alarm_description   = "Number of healthy nodes in Target Group"
  actions_enabled     = "true"
  alarm_actions       = [aws_sns_topic.sns.arn]
  ok_actions          = [aws_sns_topic.sns.arn]
  dimensions = {
    TargetGroup  = aws_lb_target_group.lb-tg.arn_suffix
    LoadBalancer = aws_lb.lb.arn_suffix
  }
}