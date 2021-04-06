resource "aws_cloudwatch_composite_alarm" "example" {
  alarm_description = "This is a composite alarm!"
  alarm_name        = "ec2-composite-alarm"

  alarm_rule = <<EOF
(ALARM(${aws_cloudwatch_metric_alarm.alpha.alarm_name}))
EOF
}

resource "aws_cloudwatch_metric_alarm" "alpha" {
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
