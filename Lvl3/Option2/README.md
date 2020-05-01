# Project Details 

## Jenkins Server on Amazon Linux 2 (EC2)

* Docker Daemon is installed.
* Terraform is setup
* Jenkins Setup
* Roles to Deploy on AWS account are attached

## Github Repository 

* Code for the application
* Docker file
* Jenkins file

## ECR Repository 

* Configured Manually
* Its credentials are are setup in Jenkins server 
* Image is pushed here with the jenkins build number tag from Jenkins server.

## Terraform for Deployment of ECS cluster, Task Definition and Cluster

* Terraform script is kept on Jenkins server
* With the new update and build cycle script runs and updates the infrastructure.
