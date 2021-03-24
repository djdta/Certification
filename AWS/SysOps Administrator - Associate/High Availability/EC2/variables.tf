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

#variable "environment" {
#  type        = string
#  description = "The Environment being deployed to"
#}

#variable "asg" {
#  type  = bool
#  default = true
#}
#

variable "dev" {
  type        = bool
  description = "If this is a multiple instance deployment, choose `true` to deploy 3 instances"
}

variable "mgmt" {
  type        = bool
  description = "If this is a multiple instance deployment, choose `true` to deploy 3 instances"
}

variable "stg" {
  type        = bool
  description = "If this is a multiple instance deployment, choose `true` to deploy 3 instances"
}

variable "prod" {
  type        = bool
  description = "If this is a multiple instance deployment, choose `true` to deploy 3 instances"
}

variable "Mixed_Instances_Policy_with_Spot_Instances" {
  type        = bool
  description = "If this is a multiple instance deployment, choose `true` to deploy 3 instances"
}

variable "Automatically_refresh_code_deployment" {
  type        = bool
  description = "If this is a multiple instance deployment, choose `true` to deploy 3 instances"
}