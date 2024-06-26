# Project Infra

This project aims to create a platform with different tools and approaches to provision secure and reliable infrastructure on the cloud.

## Done

- `terraform-actions/` - Run locally to Configure the trust between GitHub Actions and AWS account.
- `terraform-infra/` - Deploys infrastructure on AWS cloud. It will become the base for infra templates.

### Next steps
- [ ] Setup S3 and DynamoDB to manage tfstate
- [ ] Refer to current branch, commit.
- [ ] Write .md files for each `terraform-<xxx>` to explain approaches and choices, share hints.
- [ ] Setup environments (develop and production)

## Tech Stack

- Cloud: AWS
- CI/CD: Github Actions
- IaC: Terraform

## AWS Environment Setup

- [x] AWS Account: AWS Free Tier
- [x] IAM User: Create an IAM user with programmatic access and adequate permissions for managing resources.
- [ ] Network: VPC, subnets etc.
- [ ] Storage
- [ ] EKS cluster

## Infrastructure with Terraform

- [x] Install Terraform: Download and install Terraform on local machine.
- [x] Terraform Configurations: Modular setup where each directory focused on exact function (`terraform-<function>/`).

## Configurations

- [ ] Ansible Roles
- [ ] Bash scripts
- [ ] Python

## CI/CD Setup

- [x] Github Actions, define workflow, jobs, steps. Explore and improve
- [ ] Continuous Integration: Code build, unit tests, and integration tests.
- [ ] Continuous Deployment: Automated deployment of the application to the Kubernetes cluster upon successful build and tests.

## Containerize Application

- [ ] Docker: Containerize application by writing a Dockerfile and building a Docker image.
- [ ] Kubernetes Deployment: Write Kubernetes deployment and service YAML files to define how application should be deployed and exposed within the cluster.

## Monitoring with the ELK Stack

- [ ] ELK Deployment: Deploy Elasticsearch, Logstash, and Kibana either on EC2 instances or within Kubernetes (as separate pods or using a managed service like Amazon Elasticsearch Service).
- [ ] Log Collection: Configure Logstash or Filebeat to collect logs from application and other services, and send them to Elasticsearch.
- [ ] Dashboards: Use Kibana to create dashboards for visualizing logs and monitoring application performance.

## Test, Iterate, and Document

- [ ] Testing: Test the entire workflow from code commit, CI/CD pipeline, to deployment in Kubernetes, and monitoring.
- [ ] Iteration: Refine configurations, scripts, and pipelines based on test outcomes.
- [ ] Documentation: Document setup, configurations, and any important findings or decisions made during the project.

