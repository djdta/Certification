## File System FSx

resource "aws_fsx_windows_file_system" "example" {
  active_directory_id = aws_directory_service_directory.example.id
  kms_key_id          = aws_kms_key.example.arn
  storage_capacity    = 300
  subnet_ids          = [aws_subnet.example.id]
  throughput_capacity = 1024
}

#TODO: Code example of Load Balancer with HA 
data "aws_vpc" "id" {
  id = var.vpc_id
}

data "aws_subnet" "example1" {
  id = var.subnet1
}

data "aws_subnet" "example2" {
  id = var.subnet2
}

data "aws_subnet" "example3" {
  id = var.subnet3
}

resource "aws_lb" "test" {
  count              = var.Application_Load_Balancer == true ? 1 : 0
  name               = "ALB-01"
  internal           = false
  load_balancer_type = "application"
  subnets = [data.aws_subnet.example1.id, data.aws_subnet.example2.id, data.aws_subnet.example3.id]

  enable_deletion_protection = false

  tags = {
    Environment = "ALB-01"
  }
}

resource "aws_lb_listener" "example" {
  count             = var.Application_Load_Balancer == true ? 1 : 0
  load_balancer_arn = aws_lb.test[0].id
  port              = "80"
  protocol          = "HTTP"


  default_action {
    target_group_arn = aws_lb_target_group.example[0].id
    type             = "forward"
  }
}

resource "aws_lb_target_group" "example" {
  count    = var.Application_Load_Balancer == true ? 1 : 0
  name     = "Web-Servers"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.id.id

  health_check {
    port     = 80
    protocol = "HTTP"
  }
}

## Network Load Balancer
resource "aws_lb" "network_lb" {
  count              = var.Network_Load_Balancer == true ? 1 : 0
  name               = "NLB-01"
  internal           = false
  load_balancer_type = "network"
  subnets            = [data.aws_subnet.example1.id, data.aws_subnet.example2.id, data.aws_subnet.example3.id]

  enable_deletion_protection = false

  tags = {
    Environment = "NLB-01"
  }
}

# Create a new Classic load balancer
resource "aws_elb" "bar" {
  count             = var.Classic_Load_balancer == true ? 1 : 0
  name               = "CLB-01"
  availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  tags = {
    Name = "CLB-01"
  }
}

## Route 53 Health Check
resource "aws_route53_health_check" "example" {
  fqdn              = "example.com"
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "5"
  request_interval  = "30"

  tags = {
    Name = "tf-test-health-check"
  }
}