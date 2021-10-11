variable "Web_Servers_with_ALB" {
  description = "This deploys Application Load Balancer"
}

variable "vpc_id" {
  description = "This for your vpc id"
  type        = string
  default     = ""
}

variable "subnet1" {
  description = "This for your first subnet"
  type        = string
  default     = ""
}

variable "subnet2" {
  description = "This for your second subnet"
  type        = string
  default     = ""
}

variable "subnet3" {
  description = "This for your third subnet"
  type        = string
  default     = ""
}

variable "sg" {
  description = "Template"
  type = string
  default = ""
}