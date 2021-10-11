## Web Servers + ALB (example1)
resource "aws_lb" "test" {
  count              = var.Web_Servers_with_ALB == true ? 1 : 0
  name               = "ALB-01"
  internal           = false
  load_balancer_type = "application"
  subnets = [ data.aws_subnet.example1.id, data.aws_subnet.example2.id, data.aws_subnet.example3.id ]

  enable_deletion_protection = false

  tags = {
    Environment = "ALB-01"
  }
}

resource "aws_lb_listener" "example" {
  count             = var.Web_Servers_with_ALB == true ? 1 : 0
  load_balancer_arn = aws_lb.test[0].id
  port              = "80"
  protocol          = "HTTP"


  default_action {
    target_group_arn = aws_lb_target_group.example[0].id
    type             = "forward"
  }
}

resource "aws_lb_target_group" "example" {
  count    = var.Web_Servers_with_ALB == true ? 1 : 0
  name     = "Web-Servers"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.id.id

  health_check {
    port     = 80
    protocol = "HTTP"
  }
}