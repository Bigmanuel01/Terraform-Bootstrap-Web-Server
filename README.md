# Terraform-Bootstrap-Web-Server

This Terraform project creates an Amazon Web Services (AWS) EC2 instance running an Apache web server in an existing VPC and subnet.

Prerequisites
Before you can use this Terraform project, make sure you have the following prerequisites:

AWS account with appropriate permissions to create an EC2 instance.
Terraform installed on your local machine. You can download Terraform from the official Terraform website: https://www.terraform.io/downloads.html

Usage
- Clone this repository to your local machine.
- Change into the project directory of your choice
- Initialize the Terraform working directory by running: terraform init
- Review and modify the main.tf file if needed to configure the desired EC2 instance settings, such as AMI ID, instance type, security groups, subnet ID, and user data.
- Apply the Terraform configuration by running: terraform apply
- Confirm the changes by typing yes when prompted.
- Wait for Terraform to create the EC2 instance. Once the process is complete, the output will display the public IP address of the EC2 instance.
- You can now access the EC2 instance using the public IP address and see the "Hello World" page served by the Apache web server.
  Clean Up
  
If you want to clean up the AWS resources created by this Terraform project, you can run: terraform destroy. This will prompt you to confirm the destruction of the EC2 instance, and upon confirmation, Terraform will remove the EC2 instance from your AWS account.

Note: Be careful when using terraform destroy as it will permanently delete the EC2 instance and all associated data. Make sure you have backups or have exported any data that you want to keep before running this command.
