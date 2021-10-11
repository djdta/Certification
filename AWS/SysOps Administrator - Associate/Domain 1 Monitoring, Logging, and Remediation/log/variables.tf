variable "Elasticsearch_Log_Publishing" {
  type        = bool
  description = "If this is a multiple instance deployment, choose `true` to deploy 3 instances"
}
variable "Route_53_log" {
  type        = bool
  description = "If this is a multiple instance deployment, choose `true` to deploy 3 instances"
}