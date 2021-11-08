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


#TODO:auto scaling policy