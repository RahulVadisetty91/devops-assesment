#!/bin/bash
n=$1
sudo sed -i 's/.*image.*/\"image\":\"840955746374.dkr.ecr.us-east-1.amazonaws.com\/web:'$n'\",/' modules/ecs_fargate_task_definition/service.json
sudo cat modules/ecs_fargate_task_definition/service.json

