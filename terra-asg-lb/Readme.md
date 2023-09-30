## Terraform AWS ASG and LB Deployment ##

This Terraform configuration deploys an AWS infrastructure consisting of a Virtual Private Cloud (VPC), public and private subnets, an Internet Gateway, a Network Address Translation (NAT) Gateway, an Application Load Balancer (ALB), an Auto Scaling Group (ASG), and associated security groups. The purpose of this infrastructure is to host web applications with high availability.

# Prerequisites
1.Before running this Terraform script, ensure you have the following:
2.An AWS account and appropriate IAM permissions to create the required resources.
3.Terraform installed on your local machine.
4.AWS CLI configured with valid credentials.

# Usage
1.Clone this repository to your local machine.
2.Navigate to the directory containing the terraform configuration files.
3.Initialize Terraform by running the following command:

```
terraform init
```
* Review and modify the terraform.tfvars file if necessary to set variables such as profile, region, and any other specific values you need.
* Apply the Terraform configuration to create the AWS resources:

```
terraform apply
```
* You will be prompted to confirm the changes. Type "yes" to proceed.
* Wait for Terraform to provision the infrastructure. This may take several minutes.
* After provisioning is complete, Terraform will display the output values, including the 
  DNS name of the ALB.
* Access your web application using the DNS name of the ALB in a web browser.
* When you are finished, you can destroy the AWS resources created by Terraform by running:

```
terraform destroy
```
* the destruction of resources by typing "yes."

## Configuration Details ##
# VPC and Subnets
* A VPC named "nick-vpc" is created with a CIDR block of "10.0.0.0/23."
* Two public subnets and one private subnet are created with their respective CIDR blocks 
  within the VPC.
* The public subnets have the map_public_ip_on_launch attribute set to true, making them 
  suitable for hosting resources that need direct internet access.
# Internet Gateway
* An Internet Gateway is attached to the VPC to allow communication between the VPC and the 
  internet.
# Route Tables
* A public route table is created and associated with the public subnets, routing traffic to 
  the Internet Gateway.
* A private route table is created and associated with the private subnet, routing traffic 
  to the NAT Gateway.
# Elastic IP and NAT Gateway
* An Elastic IP (EIP) is allocated for the NAT Gateway.
* A NAT Gateway is created in the public subnet to allow the private subnet to access the 
  internet.
# Load Balancer
* An Application Load Balancer (ALB) named "nick-lb-asg" is created.
* The ALB has listeners for HTTP traffic on port 80.
* Security groups are associated with the ALB to allow incoming HTTP and HTTPS traffic.
  Auto Scaling Group (ASG) and EC2 Instances
# Auto Scaling Group(ASG) and EC2 Instances
* An AWS Launch Template is defined for EC2 instances, specifying instance type, user data 
  script, and network configuration.
* An ASG is created with a desired capacity of 1 instance and is associated with the ALB 
  target group.
* The ASG instances are launched in the private subnet, allowing them to be reached via the 
  ALB.
# Security Groups
*Security groups are created for the ALB and EC2 instances to control incoming and outgoing traffic.
# Customization
* You can modify the terraform.tfvars file to customize variables such as profile, region, 
  and other settings.
* Update the user_data.sh script in the configuration with your desired user data for EC2 
  instances.
* Adjust the instance type, instance count, and other parameters in the Launch Template and 
  ASG sections to meet your requirements.
# Cleaning Up
To destroy the created AWS resources and clean up:
```
terraform destroy
```
Confirm the destruction of resources by typing "yes." This will remove all the resources created by Terraform.





