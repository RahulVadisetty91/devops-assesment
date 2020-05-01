# Project Details 

[Link To Jenkins Jobs] (http://100.24.19.122:8080/job/ECS-Deploy/)


## Infra Setup

### Jenkins Server on Amazon Linux 2 (EC2)

* Docker Daemon is installed.
* Terraform is setup
* Jenkins Setup
* Roles to Deploy on AWS account are attached

### Github Repository 

* Code for the application
* Docker file
* Jenkins file

### ECR Repository 

* Configured Manually
* Its credentials are are setup in Jenkins server 
* Image is pushed here with the jenkins build number tag from Jenkins server.

### Terraform for Deployment of ECS cluster, Task Definition and Cluster

* Terraform script is kept on Jenkins server
* With the new update and build cycle script runs and updates the infrastructure.

## Jenkins PipeLine 

### SCM CheckOut

* Pull the Jenkinsfile
* Pull all the file from github

### Build Image
* Build image from DockerFile and using the application file

### Push Image

* Now these image push this image to ECR repository

### Deploy App

* Run bash script (script.sh) to build the container definition. This bash script updates the image url with a new tag in the container definition. Then this container definition file is used by task definition.
* Terraform init : to pull providers files
* Terraform plan : to detect the changes and plan architecture
* Terraform apply : to apply the changes to infrastructure


