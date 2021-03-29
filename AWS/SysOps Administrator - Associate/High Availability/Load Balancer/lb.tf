resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = aws_subnet.public.*.id

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}

# Network Load Balancer
resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "network"
  subnets            = aws_subnet.public.*.id

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}

## Specifying Elastic IPs
resource "aws_lb" "example" {
  name               = "example"
  load_balancer_type = "network"

  subnet_mapping {
    subnet_id     = aws_subnet.example1.id
    allocation_id = aws_eip.example1.id
  }

  subnet_mapping {
    subnet_id     = aws_subnet.example2.id
    allocation_id = aws_eip.example2.id
  }
}

# Specifying private IP addresses for an internal-facing load balancer
resource "aws_lb" "example" {
  name               = "example"
  load_balancer_type = "network"

  subnet_mapping {
    subnet_id            = aws_subnet.example1.id
    private_ipv4_address = "10.0.1.15"
  }

  subnet_mapping {
    subnet_id            = aws_subnet.example2.id
    private_ipv4_address = "10.0.2.15"
  }
}

## Forward Action
resource "aws_lb" "front_end" {
  # ...
}

resource "aws_lb_target_group" "front_end" {
  # ...
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
}

## Redirect Action
resource "aws_lb" "front_end" {
  # ...
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# Fixed-response Action
resource "aws_lb" "front_end" {
  # ...
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}

# Gateway Load Balancer Listener
resource "aws_lb" "example" {
  load_balancer_type = "gateway"
  name               = "example"

  subnet_mapping {
    subnet_id = aws_subnet.example.id
  }
}

resource "aws_lb_target_group" "example" {
  name     = "example"
  port     = 6081
  protocol = "GENEVE"
  vpc_id   = aws_vpc.example.id

  health_check {
    port     = 80
    protocol = "HTTP"
  }
}

resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.example.id

  default_action {
    target_group_arn = aws_lb_target_group.example.id
    type             = "forward"
  }
}

# Instance Target Group
resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# IP Target Group
resource "aws_lb_target_group" "ip-example" {
  name        = "tf-example-lb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.main.id
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Lambda Target Group
resource "aws_lb_target_group" "lambda-example" {
  name        = "tf-example-lb-tg"
  target_type = "lambda"
}