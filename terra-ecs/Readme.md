# Terraform and ECS AWS Infrastructure #

This Terraform configuration defines an AWS infrastructure setup for deploying a simple web application using AWS Fargate. The infrastructure includes the following components:
```
- Virtual Private Cloud (VPC)
- Public and Private Subnets
- Internet Gateway
- Network Address Translation (NAT) Gateways
- Route Tables
- Security Groups
- Application Load Balancer
- ECS (Elastic Container Service) Cluster and Service
```
## Prerequisites

Before you can use this Terraform configuration, ensure that you have the following prerequisites:

- AWS CLI configured with appropriate credentials.
- Terraform installed on your local machine.

## Usage

1. Clone this repository to your local machine.
2. Navigate to the directory containing these Terraform files.
3. Run the following commands:

   ```shell
   terraform init
   terraform plan
   terraform apply
   ```

   This will initialize Terraform, show you the execution plan, and apply the changes to create the AWS infrastructure.

4. After Terraform has successfully applied the changes, you can find the load balancer DNS name in the output.

## Variables

- `app_count` (default: 1): The desired number of Fargate tasks to run in the ECS service.

## Outputs

- `load_balancer_ip`: The DNS name of the Application Load Balancer (ALB) created in the infrastructure.

## Version Compatibility

This configuration is compatible with Terraform version 0.14 and uses the AWS provider version 4.0.

## Provider Configuration

The AWS provider is configured with the following settings:

- Region: `us-east-1`
- Profile: `default`
- Default tags are applied to resources with a "Name" tag set to "architect-demo."

## Additional Information

- The ECS service runs a Docker container based on the image `"registry.gitlab.com/architect-io/artifacts/nodejs-hello-world:latest"`. This is a simple Node.js Hello World application.

- The security groups in this configuration are set up to allow traffic on port 80 (HTTP) and port 3000 (the application's port).

- The ALB forwards traffic to Fargate tasks running on port 3000.

- The infrastructure is set up with both public and private subnets, with the private subnets being used for the ECS tasks and the public subnets being used for the ALB.

- NAT gateways are used in the public subnets to allow private subnet resources to access the internet.

- Route tables are set up to direct traffic appropriately within the VPC.

## Cleanup

To destroy the created infrastructure and release AWS resources, you can run:

```shell
terraform destroy
```

