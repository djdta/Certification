# Feature flags
# Conditionally based on feature flag
#count = local.provision_b59func == true ? 1 : 0
# If 'true', provision 1 of this resource
# If 'false', don't provision this

# With Latest Version Of Launch Template
resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      = "ami-096cb92bb3580c759"
  instance_type = "t2.micro"

}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["eu-west-2a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  count              = var.dev == true ? 3 : 0

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_group" "example" {
  count              = var.mgmt == true ? 3 : 0
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.foobar.id
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

## Automatically refresh all instances after the group is updated

resource "aws_launch_template" "example_refresh" {
  image_id      = data.aws_ami.example.id
  instance_type = "t3.nano"
}

resource "aws_autoscaling_group" "example_refresh" {
  count = var.Automatically_refresh_code_deployment == true ? 1 : 0
  availability_zones = ["eu-west-2a"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1

  launch_template {
    id      = aws_launch_template.example_refresh.id
    version = aws_launch_template.example_refresh.latest_version
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
#
#resource "aws_autoscaling_group" "bar" {
#  name                      = "foobar3-terraform-test"
#  max_size                  = 5
#  min_size                  = 2
#  health_check_grace_period = 300
#  health_check_type         = "ELB"
#  desired_capacity          = 4
#  force_delete              = true
#  placement_group           = aws_placement_group.test.id
#  launch_configuration      = aws_launch_configuration.foobar.name
#  vpc_zone_identifier       = [aws_subnet.example1.id, aws_subnet.example2.id]
#
#  initial_lifecycle_hook {
#    name                 = "foobar"
#    default_result       = "CONTINUE"
#    heartbeat_timeout    = 2000
#    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
#
#    notification_metadata = <<EOF
#{
#  "foo": "bar"
#}
#EOF
#
#    notification_target_arn = "arn:aws:sqs:us-east-1:444455556666:queue1*"
#    role_arn                = "arn:aws:iam::123456789012:role/S3Access"
#  }
#
#  tag {
#    key                 = "foo"
#    value               = "bar"
#    propagate_at_launch = true
#  }
#
#  timeouts {
#    delete = "15m"
#  }
#
#  tag {
#    key                 = "lorem"
#    value               = "ipsum"
#    propagate_at_launch = false
#  }
#}
#
#
#
## Mixed Instances Policy with Spot Instances and Capacity Rebalance

data "aws_ami" "example" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_launch_template" "example_mixed" {
  name_prefix   = "example"
  image_id      = data.aws_ami.example.id
  instance_type = "t2.mirco"
}

resource "aws_autoscaling_group" "example_mixed" {
  count = var.Mixed_Instances_Policy_with_Spot_Instances == true ? 1 : 0
  availability_zones = ["eu-west-2a"]
  capacity_rebalance  = true
  desired_capacity    = 3
  max_size            = 3
  min_size            = 1
  #vpc_zone_identifier = [aws_subnet.example1.id, aws_subnet.example2.id]

  mixed_instances_policy {
    instances_distribution {
      on_demand_base_capacity                  = 0
      on_demand_percentage_above_base_capacity = 25
      spot_allocation_strategy                 = "capacity-optimized"
    }

    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.example_mixed.id
      }

      override {
        instance_type     = "t2.mirco"
        weighted_capacity = "3"
      }

      override {
        instance_type     = "t3.medium"
        weighted_capacity = "2"
      }
    }
  }
}

#resource "aws_launch_template" "example2" {
#  name_prefix = "example2"
#  image_id    = data.aws_ami.example2.id
#}
#
#resource "aws_autoscaling_group" "example" {
#  availability_zones = ["us-east-1a"]
#  desired_capacity   = 1
#  max_size           = 1
#  min_size           = 1
#
#  mixed_instances_policy {
#    launch_template {
#      launch_template_specification {
#        launch_template_id = aws_launch_template.example.id
#      }
#
#      override {
#        instance_type     = "c4.large"
#        weighted_capacity = "3"
#      }
#
#      override {
#        instance_type = "c6g.large"
#        launch_template_specification {
#          launch_template_id = aws_launch_template.example2.id
#        }
#        weighted_capacity = "2"
#      }
#    }
#  }
#}
#
#resource "aws_autoscaling_group" "bar" {
#  name                 = "foobar3-terraform-test"
#  max_size             = 5
#  min_size             = 2
#  launch_configuration = aws_launch_configuration.foobar.name
#  vpc_zone_identifier  = [aws_subnet.example1.id, aws_subnet.example2.id]
#
#  tags = concat(
#    [
#      {
#        "key"                 = "interpolation1"
#        "value"               = "value3"
#        "propagate_at_launch" = true
#      },
#      {
#        "key"                 = "interpolation2"
#        "value"               = "value4"
#        "propagate_at_launch" = true
#      },
#    ],
#    var.extra_tags,
#  )
#}
#





#resource "aws_autoscaling_group" "foobar" {
#  availability_zones   = ["us-west-2a"]
#  name                 = "terraform-test-foobar5"
#  health_check_type    = "EC2"
#  termination_policies = ["OldestInstance"]
#
#  tag {
#    key                 = "Foo"
#    value               = "foo-bar"
#    propagate_at_launch = true
#  }
#}
