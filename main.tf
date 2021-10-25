#################################################
# Security groups
#################################################
module "aws_security_group" {
  source = "git@github.com:dbgoytia/sg-tf-module.git?ref=v0.0.1"
  name = format(
    "%s-sg",
    var.name
  )
  description   = var.name
  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
  vpc_id        = var.vpc_id
  region        = var.region
}

#################################################
# Launch templates
#################################################
resource "aws_launch_template" "launch_template" {
  name = format(
    "%s-lt",
    var.name
  )

  block_device_mappings {
    device_name = var.root_device_name
    ebs {
      volume_size = var.root_volume_size
    }
  }

  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_termination              = var.disable_api_termination
  ebs_optimized                        = var.ebs_optimized
  image_id                             = var.image_id
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_type                        = var.instance_type

  monitoring {
    enabled = var.monitoring
  }

  vpc_security_group_ids = [module.aws_security_group.id]

  tag_specifications {
    resource_type = "instance"
    tags = merge(
      {
        Name = format(
          "%s-lt",
        var.name)
      },
      var.tags
    )
  }
}

#################################################
# Autoscaling group
#################################################
resource "aws_autoscaling_group" "this" {
  name = format(
    "%s-asg",
    var.name
  )

  enabled_metrics     = var.enabled_metrics
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = var.vpc_zone_identifier

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
}