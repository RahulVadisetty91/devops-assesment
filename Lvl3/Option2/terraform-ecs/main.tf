

provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::840955746374:role/ec2-access"
  }
  region     = "us-east-1"
}

module "ecs-cluster" {
      source  = "./modules/ecs_cluster/"
      name    = "ecs"
  }

module "ecs-fargate-service" {
    source       = "./modules/ecs_fargate_service/"
    name-preffix = "ecs"
    ecs-cluster-arn = module.ecs-cluster.ecs-cluster-arn
    task-definition-arn = module.ecs-fargate-task-definition.ecs-task-definition-arn
    desired-count = 1 
    security-groups-id = ["sg-ad1c09f4"]
    public-subnets = ["subnet-00edf5fade1e62ca6"]
    assign-public-ip = true
}

module "ecs-fargate-task-definition" {
  source       = "./modules/ecs_fargate_task_definition/"

}

