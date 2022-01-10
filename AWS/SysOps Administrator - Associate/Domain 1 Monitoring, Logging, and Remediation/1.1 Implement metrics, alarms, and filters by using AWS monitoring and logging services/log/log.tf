resource "aws_cloudwatch_log_group" "webserver" {
  name  = "Yada"

  tags = {
    Environment = "production"
    Application = "WebServers"
  }
}
#TODO: Added the log stream into the terraform code.

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
