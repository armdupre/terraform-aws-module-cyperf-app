resource "aws_instance" "Instance" {
	disable_api_termination = local.InstanceDisableApiTermination
	instance_initiated_shutdown_behavior = local.InstanceInstanceInitiatedShutdownBehavior
	ami = data.aws_ami.Ami.image_id
	instance_type = local.InstanceType
	monitoring = local.InstanceMonitoring
	iam_instance_profile = aws_iam_instance_profile.IamInstanceProfile.id
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_${local.InstanceId}_${local.Tag}_${local.Version}_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
	user_data = local.init_cli
	network_interface {
		network_interface_id = aws_network_interface.Eth0.id
		device_index = "0"
	}
	root_block_device {
		delete_on_termination = local.InstanceEbsDeleteOnTermination
		volume_type = local.InstanceEbsVolumeType
	}
	timeouts {
		create = "9m"
		delete = "5m"
	}
}

resource "aws_network_interface" "Eth0" {
	description = "${local.UserLoginTag}_${local.ProjectTag}_${local.Tag}_${local.InstanceId}_${local.Version}_ETH0_${local.RegionTag}"
	source_dest_check = local.InterfaceSourceDestCheck
	subnet_id = local.PublicSubnetId
	security_groups = [
		local.PublicSecurityGroupId
	]
	tags = {
		Name = "${local.UserLoginTag}_${local.ProjectTag}_${local.Tag}_${local.InstanceId}_${local.Version}_ETH0_${local.RegionTag}"
		Owner = local.UserEmailTag
		Project = local.ProjectTag
	}
}

resource "aws_eip" "Eth0ElasticIp" {
	domain = "vpc"
	network_interface = aws_network_interface.Eth0.id
	depends_on = [
		aws_instance.Instance
	]
}

resource "time_sleep" "SleepDelay" {
	create_duration = local.SleepDelay
	depends_on = [
		aws_instance.Instance
	]
}