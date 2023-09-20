# Elastic Beanstalk Application and Environment with Terraform #

This repository contains Terraform code to create an Elastic Beanstalk application and environment on AWS.

## Description

This Terraform code is used to provision an AWS Elastic Beanstalk application and environment with the following resources:

- Elastic Beanstalk Application
- Elastic Beanstalk Environment

The Elastic Beanstalk environment is configured with various settings, including VPC, autoscaling, instance type, load balancer type, and more.

## Prerequisites

Before you can use this Terraform code, ensure you have the following prerequisites:

1. AWS CLI installed and configured with valid credentials.
2. Terraform installed on your local machine.
3. AWS Elastic Beanstalk service familiarity.

## Usage

1. Clone this repository to your local machine.
2. Modify the `vars.tf` file to set the desired values for your Elastic Beanstalk application and environment.
3. Run the following commands in the repository directory:

```bash
terraform init
terraform apply
```

4. Review the changes that Terraform plans to apply and confirm by typing `yes` when prompted.
5. Wait for Terraform to provision the resources.

## Variables

The `vars.tf` file contains the following variables that you can customize:

- `elasticapp`: The name of the Elastic Beanstalk application. (Default: "myapplication")
- `beanstalkappenv`: The name of the Elastic Beanstalk environment. (Default: "myenvironment")
- `solution_stack_name`: The solution stack name for the environment. (Default: "64bit Amazon Linux 2 v3.3.14 running Python 3.8")
- `tier`: The tier of the Elastic Beanstalk environment. (Default: "WebServer")
- `vpc_id`: The ID of the VPC where the environment will be created. (Default: "vpc-007cf62dc349b3e83")
- `public_subnets`: List of public subnets for the environment. (Default: ["subnet-010b59c552310d5a0", "subnet-0d0a900706d01b0c4"])

Adjust these variables according to your specific requirements.

## Provider Configuration

The `provider.tf` file specifies the AWS provider configuration with the following settings:

- `region`: The AWS region where the resources will be created. (Default: "us-east-1")
- `profile`: The AWS CLI profile to use for authentication. (Default: "default")

Modify the `provider.tf` file if you need to use a different AWS region or profile.

## Contributing

If you find issues with this code or have improvements to suggest, please feel free to open an issue or submit a pull request. Contributions are welcome!

## License

This code is licensed under the [MIT License](LICENSE). Feel free to use it as a starting point for your own projects.
