variable "stream" {
  description = "accountinfo"
  type        = string
}

variable "aws_region" {
  description = "accountinfo"
  type        = string
}

variable "deploy_environment" {
  description = "accountinfo"
  type        = string
}


variable "availability_zone_name" {
  description = "accountinfo"
  type        = string
  default     = null
}


variable "creation_token" {
  description = "accountinfo"
  type        = string
}


variable "performance_mode" {
  description = "accountinfo"
  type        = string
}


variable "encrypted" {
  description = "accountinfo"
  type        = string
}

/*
variable "kms_key_arn" {
  description = "accountinfo"
  type        = string
}
*/

variable "provisioned_throughput_in_mibps" {
  description = "accountinfo"
  type        = number
}

variable "throughput_mode" {
  description = "accountinfo"
  type        = string
}

variable "security_groups" {
  description = "accountinfo"
  type        = list(string)
}

variable "policy" {
  description = "accountinfo"
  type        = string
}

/*

variable "subnet_az1_id" {
  description = "readvariables"
  type        = string
}

variable "subnet_az2_id" {
  description = "readvariables"
  type        = string
}
*/


variable "mount_targets" {
  description = "A map of mount target definitions to create"
  type        = any
  default     = {}
}


variable "create" {
  description = "Determines whether resources will be created (affects all resources)"
  type        = bool
  default     = true
}

variable "name" {
type        = string

}