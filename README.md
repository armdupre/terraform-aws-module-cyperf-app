# module-cyperf-app/aws

## Description
Terraform module for CyPerf application deployment on Amazon Web Services

## Deployment
This module creates a single instance having a single network interface.

## Usage
```tf
module "App" {
	source  = "git::https://github.com/armdupre/terraform-aws-module-cyperf-app.git"
	Eth0SecurityGroupId = aws_security_group.PublicSecurityGroup.id
	Eth0SubnetId = aws_subnet.PublicSubnet.id
}
```