# With Latest Version Of Launch Template

# TODO: Revamp the terraform code and aws cli commands also
# Create a launch template
# Create a EC2 autoscaling group

#TODO:auto scaling policy

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "AWS Training"
  }
}

resource "aws_subnet" "main" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.training_subnets[count.index] 
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "AWS Training"
  }
}

resource "aws_launch_configuration" "config" {
  name          = var.launch_configuration_name
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  	user_data = <<EOF
      #! /bin/bash
      sudo apt-get update
      sudo apt-get install -y apache2
      sudo systemctl start apache2
      sudo systemctl enable apache2
      echo "Page served from AZ $(curl http://169.254.169.254/latest/meta-data/placement/availability-zone)" > /var/www/html/index.html
	EOF
}

resource "aws_autoscaling_group" "bar" {
  name                      = var.autoscaling_group_name
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  vpc_zone_identifier       = [aws_subnet.main[0].id, aws_subnet.main[1].id, aws_subnet.main[2].id]
  launch_configuration      = aws_launch_configuration.config.name

  tag {
    key                 = var.autoscaling_group_name
    value               = "bar"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "lorem"
    value               = "ipsum"
    propagate_at_launch = true
  }
}
