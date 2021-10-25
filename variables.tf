variable "core_count" {
  description = "Number of cores to associte to EC2 instance"
  type        = number
  default     = 2
}

variable "create_default_sg" {
  description = "Create security group for EC2 instances"
  type        = bool
  default     = true
}

variable "disable_api_termination" {
  description = "If true, enable EC2 instance termination protection."
  type        = bool
  default     = false
}

variable "enabled_metrics" {
  description = "(Optional) A list of metrics to collect. The allowed values are GroupMinSize, GroupMaxSize, GroupDesiredCapacity, GroupInServiceInstances, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances."
  type        = list(any)
  default     = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances", ]
}

variable "ebs_optimized" {
  description = "If true, enable EBS optimization for EC2."
  type        = bool
  default     = true
}

variable "env" {
  description = "Deployment environment for aws resources."
  type        = string
}

variable "egress_rules" {
  description = "A map of egress rules"
  type        = list(map(string))
  default     = []
}

variable "egress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = []
}

variable "ingress_rules" {
  description = "A map of ingress rules"
  type        = list(map(string))
  default     = []
}

variable "ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = []
}

variable "image_id" {
  description = "AMI to use for deployment (ID)"
  type        = string
}

variable "instance_initiated_shutdown_behavior" {
  description = "Shutdown behaviour for ec2 instance. Can be 'stop' or 'terminate'."
  type        = string
  default     = "stop"
}

variable "instance_type" {
  description = "Instance type to use for deployment."
  type        = string
  default     = "t2.micro"
}

variable "max_size" {
  description = "Max size of the ASG."
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Min size of ASG."
  type        = number
  default     = 1
}

variable "name" {
  description = "Name of the ASG resources"
  type        = string
}

variable "network_interfaces_configuration" {
  description = "A list of configurations available for network interfaces at launch time."
  type        = map(any)
  default = {
    delete_on_termination = true
  }
}

variable "monitoring" {
  description = "Wether to enable monitoring on the EC2 instance or not."
  type        = bool
  default     = true
}

variable "vpc_security_group_ids" {
  description = "VPC security group ID to associate with"
  type        = string
  default     = ""
}

variable "region" {
  description = "Deployment region for aws resources."
  type        = string
}

variable "root_volume_size" {
  description = "Root volume size for EC2 instance."
  type        = number
  default     = 20
}

variable "root_device_name" {
  description = "Root device name for EC2 instances."
  type        = string
  default     = "/dev/sda1"
}

variable "threads_per_core" {
  description = "Number of threads per core on EC2."
  type        = number
  default     = 2
}

variable "vpc_id" {
  description = "VPC ID for deployment"
  type        = string
}

variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in."
  type        = list(any)
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(any)
  default     = {}
}