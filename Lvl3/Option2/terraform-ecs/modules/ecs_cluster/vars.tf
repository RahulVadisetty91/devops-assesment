# ---------------------------------------------------------------------------------------------------------------------
# ECS CLUSTER
# ---------------------------------------------------------------------------------------------------------------------
variable "name" {
  description = "The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  type = string 
  default = "ecs-cluster"
}