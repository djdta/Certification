DynamoDB Table Autoscaling
resource "aws_appautoscaling_target" "dynamodb_table_read_target" {
  max_capacity       = 100
  min_capacity       = 5
  resource_id        = "table/tableName"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "dynamodb_table_read_policy" {
  name               = "DynamoDBReadCapacityUtilization:${aws_appautoscaling_target.dynamodb_table_read_target.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.dynamodb_table_read_target.resource_id
  scalable_dimension = aws_appautoscaling_target.dynamodb_table_read_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.dynamodb_table_read_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }

    target_value = 70
  }
}

ECS Service Autoscaling
resource "aws_appautoscaling_target" "ecs_target" {
  max_capacity       = 4
  min_capacity       = 1
  resource_id        = "service/clusterName/serviceName"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "ecs_policy" {
  name               = "scale-down"
  policy_type        = "StepScaling"
  resource_id        = aws_appautoscaling_target.ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_target.service_namespace

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = -1
    }
  }
}

Preserve desired count when updating an autoscaled ECS Service
resource "aws_ecs_service" "ecs_service" {
  name            = "serviceName"
  cluster         = "clusterName"
  task_definition = "taskDefinitionFamily:1"
  desired_count   = 2

  lifecycle {
    ignore_changes = [desired_count]
  }
}

Aurora Read Replica Autoscaling
resource "aws_appautoscaling_target" "replicas" {
  service_namespace  = "rds"
  scalable_dimension = "rds:cluster:ReadReplicaCount"
  resource_id        = "cluster:${aws_rds_cluster.example.id}"
  min_capacity       = 1
  max_capacity       = 15
}

resource "aws_appautoscaling_policy" "replicas" {
  name               = "cpu-auto-scaling"
  service_namespace  = aws_appautoscaling_target.replicas.service_namespace
  scalable_dimension = aws_appautoscaling_target.replicas.scalable_dimension
  resource_id        = aws_appautoscaling_target.replicas.resource_id
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "RDSReaderAverageCPUUtilization"
    }

    target_value       = 75
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}

resource "aws_appautoscaling_target" "dynamodb_table_read_target" {
  max_capacity       = 100
  min_capacity       = 5
  resource_id        = "table/${aws_dynamodb_table.example.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}
resource "aws_appautoscaling_target" "dynamodb_index_read_target" {
  max_capacity       = 100
  min_capacity       = 5
  resource_id        = "table/${aws_dynamodb_table.example.name}/index/${var.index_name}"
  scalable_dimension = "dynamodb:index:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_target" "ecs_target" {
  max_capacity       = 4
  min_capacity       = 1
  resource_id        = "service/${aws_ecs_cluster.example.name}/${aws_ecs_service.example.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_target" "replicas" {
  service_namespace  = "rds"
  scalable_dimension = "rds:cluster:ReadReplicaCount"
  resource_id        = "cluster:${aws_rds_cluster.example.id}"
  min_capacity       = 1
  max_capacity       = 15
}

# Create a new load balancer attachment
resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  elb                    = aws_elb.bar.id
}
# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  alb_target_group_arn   = aws_alb_target_group.test.arn
}

resource "aws_autoscaling_group" "asg" {
  # ... other configuration ...

  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  elb                    = aws_elb.test.id
}

resource "aws_placement_group" "test" {
  name     = "test"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "bar" {
  name                      = "foobar3-terraform-test"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  placement_group           = aws_placement_group.test.id
  launch_configuration      = aws_launch_configuration.foobar.name
  vpc_zone_identifier       = [aws_subnet.example1.id, aws_subnet.example2.id]

  initial_lifecycle_hook {
    name                 = "foobar"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 2000
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"

    notification_metadata = <<EOF
{
  "foo": "bar"
}
EOF

    notification_target_arn = "arn:aws:sqs:us-east-1:444455556666:queue1*"
    role_arn                = "arn:aws:iam::123456789012:role/S3Access"
  }

  tag {
    key                 = "foo"
    value               = "bar"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "lorem"
    value               = "ipsum"
    propagate_at_launch = false
  }
}

With Latest Version Of Launch Template
resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      = "ami-1a2b3c"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}

Mixed Instances Policy
resource "aws_launch_template" "example" {
  name_prefix   = "example"
  image_id      = data.aws_ami.example.id
  instance_type = "c5.large"
}

resource "aws_autoscaling_group" "example" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.example.id
      }

      override {
        instance_type     = "c4.large"
        weighted_capacity = "3"
      }

      override {
        instance_type     = "c3.large"
        weighted_capacity = "2"
      }
    }
  }
}

Mixed Instances Policy with Spot Instances and Capacity Rebalance
resource "aws_launch_template" "example" {
  name_prefix   = "example"
  image_id      = data.aws_ami.example.id
  instance_type = "c5.large"
}

resource "aws_autoscaling_group" "example" {
  capacity_rebalance  = true
  desired_capacity    = 12
  max_size            = 15
  min_size            = 12
  vpc_zone_identifier = [aws_subnet.example1.id, aws_subnet.example2.id]

  mixed_instances_policy {
    instances_distribution {
      on_demand_base_capacity                  = 0
      on_demand_percentage_above_base_capacity = 25
      spot_allocation_strategy                 = "capacity-optimized"
    }

    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.example.id
      }

      override {
        instance_type     = "c4.large"
        weighted_capacity = "3"
      }

      override {
        instance_type     = "c3.large"
        weighted_capacity = "2"
      }
    }
  }
}

resource "aws_launch_template" "example" {
  name_prefix   = "example"
  image_id      = data.aws_ami.example.id
  instance_type = "c5.large"
}

resource "aws_launch_template" "example2" {
  name_prefix = "example2"
  image_id    = data.aws_ami.example2.id
}

resource "aws_autoscaling_group" "example" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.example.id
      }

      override {
        instance_type     = "c4.large"
        weighted_capacity = "3"
      }

      override {
        instance_type = "c6g.large"
        launch_template_specification {
          launch_template_id = aws_launch_template.example2.id
        }
        weighted_capacity = "2"
      }
    }
  }
}

variable "extra_tags" {
  default = [
    {
      key                 = "Foo"
      value               = "Bar"
      propagate_at_launch = true
    },
    {
      key                 = "Baz"
      value               = "Bam"
      propagate_at_launch = true
    },
  ]
}

resource "aws_autoscaling_group" "bar" {
  name                 = "foobar3-terraform-test"
  max_size             = 5
  min_size             = 2
  launch_configuration = aws_launch_configuration.foobar.name
  vpc_zone_identifier  = [aws_subnet.example1.id, aws_subnet.example2.id]

  tags = concat(
    [
      {
        "key"                 = "interpolation1"
        "value"               = "value3"
        "propagate_at_launch" = true
      },
      {
        "key"                 = "interpolation2"
        "value"               = "value4"
        "propagate_at_launch" = true
      },
    ],
    var.extra_tags,
  )
}
Automatically refresh all instances after the group is updated
resource "aws_autoscaling_group" "example" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1

  launch_template {
    id      = aws_launch_template.example.id
    version = aws_launch_template.example.latest_version
  }

  tag {
    key                 = "Key"
    value               = "Value"
    propagate_at_launch = true
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }
}

data "aws_ami" "example" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_launch_template" "example" {
  image_id      = data.aws_ami.example.id
  instance_type = "t3.nano"
}

resource "aws_autoscaling_group" "foobar" {
  availability_zones   = ["us-west-2a"]
  name                 = "terraform-test-foobar5"
  health_check_type    = "EC2"
  termination_policies = ["OldestInstance"]

  tag {
    key                 = "Foo"
    value               = "foo-bar"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_lifecycle_hook" "foobar" {
  name                   = "foobar"
  autoscaling_group_name = aws_autoscaling_group.foobar.name
  default_result         = "CONTINUE"
  heartbeat_timeout      = 2000
  lifecycle_transition   = "autoscaling:EC2_INSTANCE_LAUNCHING"

  notification_metadata = <<EOF
{
  "foo": "bar"
}
EOF

  notification_target_arn = "arn:aws:sqs:us-east-1:444455556666:queue1*"
  role_arn                = "arn:aws:iam::123456789012:role/S3Access"
}

resource "aws_autoscaling_notification" "example_notifications" {
  group_names = [
    aws_autoscaling_group.bar.name,
    aws_autoscaling_group.foo.name,
  ]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.example.arn
}

resource "aws_sns_topic" "example" {
  name = "example-topic"

  # arn is an exported attribute
}

resource "aws_autoscaling_group" "bar" {
  name = "foobar1-terraform-test"

  # ...
}

resource "aws_autoscaling_group" "foo" {
  name = "barfoo-terraform-test"

  # ...
}

resource "aws_autoscaling_policy" "bat" {
  name                   = "foobar3-terraform-test"
  scaling_adjustment     = 4
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.bar.name
}

resource "aws_autoscaling_group" "bar" {
  availability_zones        = ["us-east-1a"]
  name                      = "foobar3-terraform-test"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  launch_configuration      = aws_launch_configuration.foo.name
}
resource "aws_autoscaling_group" "foobar" {
  availability_zones        = ["us-west-2a"]
  name                      = "terraform-test-foobar5"
  max_size                  = 1
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  termination_policies      = ["OldestInstance"]
}

resource "aws_autoscaling_schedule" "foobar" {
  scheduled_action_name  = "foobar"
  min_size               = 0
  max_size               = 1
  desired_capacity       = 0
  start_time             = "2016-12-11T18:00:00Z"
  end_time               = "2016-12-12T06:00:00Z"
  autoscaling_group_name = aws_autoscaling_group.foobar.name
}