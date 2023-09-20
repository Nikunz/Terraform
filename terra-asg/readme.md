# Terraform AWS Infrastructure Configuration #



# Terraform with Autoscaling group #
This repository contains Terraform code to provision AWS infrastructure resources, including a security group, an autoscaling group, and associated configurations.

## Prerequisites

Before using this Terraform configuration, ensure you have the following prerequisites in place:

- [Terraform](https://www.terraform.io/) installed (version 0.14 or higher)
- AWS CLI configured with appropriate credentials and region

## Configuration Files

### `main.tf`

This file defines the AWS resources being created:

- `aws_security_group`: A security group allowing inbound traffic on ports 22 (SSH) and 80 (HTTP).
- `aws_launch_template`: A launch template specifying instance configuration, including the user data script.
- `aws_autoscaling_group`: An autoscaling group using the specified launch template, with capacity configurations.

### `providers.tf`

This file specifies the Terraform provider configuration for AWS. It sets the AWS region and profile (if applicable).

### `script.sh`

This shell script is embedded in the launch template and is executed when instances are launched. It updates the system, installs the Apache HTTP server, starts it, and enables it to start on boot.

### `variable.tf`

This file defines Terraform variables used in the configuration:

- `ami_id`: The AMI (Amazon Machine Image) ID to use for the EC2 instances.
- `instance`: The EC2 instance type for the autoscaling group.
- `subnet_id_1` and `subnet_id_2`: The IDs of the subnets in your VPC where instances will be launched.

## Usage

1. Clone this repository to your local machine.

   ```bash
   git clone <repository_url>
   ```

2. Change into the cloned directory.

   ```bash
   cd <repository_directory>
   ```

3. Initialize Terraform to download the required provider.

   ```bash
   terraform init
   ```

4. Review and adjust the variables in `variable.tf` as needed.

5. Apply the Terraform configuration to create the resources.

   ```bash
   terraform apply
   ```

6. Confirm the changes and apply them by typing `yes` when prompted.

## Clean-Up

To destroy the AWS resources created by this Terraform configuration, run:

```bash
terraform destroy
```

Confirm the destruction by typing `yes` when prompted.
