Aurora_RDS_Auto_Scale = true
Dynamodb_Auto_Scale = false
EC2_Auto_Scale = false
ECS_Auto_Scale = false
Elastic_Cache = false

launch_configuration_name = "training-config"
instance_type = "t2.micro"
autoscaling_group_name = "auto-scaling-group"

training_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24"
]