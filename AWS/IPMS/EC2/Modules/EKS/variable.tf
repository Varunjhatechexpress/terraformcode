variable "cluster_role" {
  description = "eksclusterrole"
  type        = string
}
/*
variable "policy_arn" {
  description = "ec2policy"
  type        = string
}
*/

variable "stream" {
  description = "accountinfo"
  type        = string
}

variable "deploy_environment" {
  description = "readvariables"
  type        = string
}

variable "aws_region" {
  description = "readvariables"
  type        = string
}
/*
variable "subnet_ids" {
  description = "readvariables"
  type        = string
}
*/

variable "node_role_arn" {
  description = "readvariables"
  type        = string
}

variable "cluster_name" {
  description = "readvariables"
  type        = string
}

variable "addon_name" {
  description = "addon name"
  type        = list(string)
}

variable "addon_version" {
  description = "addon version"
  type        = list(string)
}


variable "enabled_cluster_log_types" {
  description = "control loggin"
  type        = list(string)
}
