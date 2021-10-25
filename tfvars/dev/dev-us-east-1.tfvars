# General configuration
region = "us-east-1"
env    = "dev"

# SG configuration
name        = "test"
description = "A Test for the tf-module"
ingress_rules = [
  {
    rule        = "ssh-tcp",
    description = "Allow ssh access to resource.",
    cidr_blocks = "0.0.0.0/0"
  }
]
egress_rules = [
  {
    rule        = "all-all"
    cidr_blocks = "0.0.0.0/0"
  },
]

# ASG configuration
vpc_id              = "vpc-3f5bf842"
image_id            = "ami-02e136e904f3da870"
vpc_zone_identifier = ["subnet-9bb32eba", "subnet-09fb6856", "subnet-7b24b31d"]
ebs_optimized       = false