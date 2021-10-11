variable "Application_Load_Balancer" {
  description = "This deploys Application Load Balancer"
}

variable "Network_Load_Balancer" {
  description = "This deploys Network Load Balancer"
}

variable "Classic_Load_balancer" {
  description = "This deploys Classic Load Balancer"
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
