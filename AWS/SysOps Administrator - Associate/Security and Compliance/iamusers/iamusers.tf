resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/"
  force_destroy = true 

  tags = {
    tag-key = "tag-value"
  }
}