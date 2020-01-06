/*
Reusable and configurable ECS module
*/

resource "aws_ecs_cluster" "voodoo-cluster" {
  name = var.cluster_name
}

module "vpc" {
  source = "../common/vpc"
}

data "aws_iam_role" "kafka_task_exec_role" {
  name = "kafkaExecutionRole"
}

data "aws_iam_role" "kafka_task_role" {
  name = "kafkaTaskRole"
}

resource "aws_ecs_task_definition" "kafka-task-definition" {
  container_definitions    = "${file("ecs/kafka/kafka-container-definition.json")}"
  family                   = "kafka-TaskDefinition"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "1vcpu"
  memory                   = "2GB"
  task_role_arn =  "${data.aws_iam_role.kafka_task_role.arn}"
  execution_role_arn = "${data.aws_iam_role.kafka_task_exec_role.arn}"
  
}

resource "aws_ecs_service" "kafka" {
  name            = "kafka"
  cluster         = "${aws_ecs_cluster.voodoo-cluster.name}"
  task_definition = "${aws_ecs_task_definition.kafka-task-definition.arn}"
  desired_count   = 1
  launch_type     = "FARGATE"

  dynamic "network_configuration" {
    for_each = var.network_mode == "awsvpc" ? ["true"] : []
    content {
      subnets = [module.vpc.private-subnet-id]
      # security_groups  = compact(concat(var.security_group_ids, aws_security_group.ecs_service.*.id))
      # assign_public_ip = var.assign_public_ip
    }
  }

}

