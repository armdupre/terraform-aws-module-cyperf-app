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
	default = "app"
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

variable "PublicSecurityGroupId" {
	type = string
}

variable "PublicSubnetId" {
	type = string
}

variable "SleepDelay" {
	default = "7m"
	type = string
}

variable "Tag" {
	default = "example"
	description = "App ID tag of application using the deployment"
	type = string
}

variable "UserEmailTag" {
	default = "terraform@example.com"
	description = "Email address tag of user creating the deployment"
	type = string
	validation {
		condition = length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	default = "terraform"
	description = "Login ID tag of user creating the deployment"
	type = string
	validation {
		condition = length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}

variable "UserProjectTag" {
	default = "module"
	description = "Project tag of user creating the deployment"
	type = string
}

variable "Version" {
	default = "2-1"
	type = string
}