variable "cluster_name" {
  description = "The name of ECS cluster"
  type = string
  default = "test"
}

variable "network_mode" {
  type        = string
  description = "The network mode to use for the task. This is required to be `awsvpc` for `FARGATE` `launch_type`"
  default     = "awsvpc"
}





