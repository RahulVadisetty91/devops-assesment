# ---------------------------------------------------------------------------------------------------------------------
# AWS ECS Task Execution Role
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "ecs-task-execution-role"
   assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ecs-tasks.amazonaws.com"
            },
            "Action": "sts:AssumeRole",
            "Sid": ""
        }
    ]
}   
EOF
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy_attach" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# ---------------------------------------------------------------------------------------------------------------------
# ECS Task Definition
# ---------------------------------------------------------------------------------------------------------------------


resource "aws_ecs_task_definition" "td" {
  family = "td"

  container_definitions = file("modules/ecs_fargate_task_definition/service.json")
task_role_arn         = aws_iam_role.ecs_task_execution_role.arn
execution_role_arn    = aws_iam_role.ecs_task_execution_role.arn
network_mode          = "awsvpc"
requires_compatibilities = ["FARGATE"]
cpu                      = 256
memory                   = 512
}
