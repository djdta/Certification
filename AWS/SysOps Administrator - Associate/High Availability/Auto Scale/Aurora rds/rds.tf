# Aurora Read Replica Autoscaling
resource "aws_rds_cluster" "example" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-postgresql"
  availability_zones      = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  database_name           = ""
  master_username         = ""
  master_password         = ""
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
}

resource "aws_appautoscaling_target" "replicas" {
  service_namespace  = "rds"
  scalable_dimension = "rds:cluster:ReadReplicaCount"
  resource_id        = "cluster:${aws_rds_cluster.example.id}"
  min_capacity       = 1
  max_capacity       = 3
}

resource "aws_appautoscaling_policy" "replicas" {
  name               = "cpu-auto-scaling"
  service_namespace  = aws_appautoscaling_target.replicas.service_namespace
  scalable_dimension = aws_appautoscaling_target.replicas.scalable_dimension
  resource_id        = aws_appautoscaling_target.replicas.resource_id
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "RDSReaderAverageCPUUtilization"
    }

    target_value       = 75
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}
