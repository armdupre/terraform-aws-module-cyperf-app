variable "AmiName" {
	default = "cyperf-mdw-1-0-10121-releasecyperf21-92384358-5015-4a4b-aed2-8113e28d871a"
	description = "AMI name used for deploying instances"
	type = string
}

variable "AmiOwner" {
	default = "aws-marketplace"
	description = "Owner of AMI used for deploying instances"
	type = string
}

variable "InstanceId" {
	default = "APP"
	type = string
}

variable "InstanceType" {
	default = "m5.xlarge"
	description = "Instance type of VM"
	type = string
	validation {
		condition = can(regex("t3.xlarge", var.InstanceType)) || can(regex("m5.xlarge", var.InstanceType))
		error_message = "AppInstanceType must be one of (t3.xlarge | m5.xlarge) types."
	}
}

variable "ProjectTag" {
	default = "CLOUD_IST"
	type = string
}

variable "PublicSecurityGroupId" {
	type = string
}

variable "PublicSubnetId" {
	type = string
}

variable "UserEmailTag" {
	type = string
	description = "Email address tag of user creating the deployment"
	validation {
		condition = length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	type = string
	description = "Login ID tag of user creating the deployment"
	validation {
		condition = length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}