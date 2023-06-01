locals {
	AmiName = var.AmiName
	AmiOwner = var.AmiOwner
	Eth0Name = "${local.Preamble}-eth0-${local.Region}"
	Eth0SecurityGroupId = var.Eth0SecurityGroupId
	Eth0SubnetId = var.Eth0SubnetId
	IamInstanceProfileName = "${local.Preamble}-iam-instance-profile-${local.Region}"
	IamPolicyName = "${local.Preamble}-iam-policy-${local.Region}"
	IamRoleName = "${local.Preamble}-iam-role-${local.Region}"
	InterfaceSourceDestCheck = false
	InstanceDisableApiTermination = false
	InstanceEbsDeleteOnTermination = true
	InstanceEbsVolumeType = "gp2"
	InstanceId = var.InstanceId
	InstanceInstanceInitiatedShutdownBehavior = "stop"
	InstanceMonitoring = false
	InstanceName = "${local.Preamble}-${local.Region}"
	InstanceType = var.InstanceType
	Preamble = "${local.UserLoginTag}-${local.UserProjectTag}-${local.Tag}-${local.InstanceId}-${local.Version}"
	Region = data.aws_region.current.name
	SleepDelay = var.SleepDelay
	Tag = var.Tag
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	UserProjectTag = var.UserProjectTag
	Version = var.Version
}

locals {
	init_cli = <<-EOF
#!/bin/bash -xe
snap list amazon-ssm-agent
    EOF
}