variable "instance_type" {
  description = "instancetype"
  type        = string
}

/*
variable "key_name" {
  description = "key_pair"
  type        = string
}

variable "cidr_blocks" {
  description = "subnets"
  type        = list(string)
}

variable "kms_key_id" {
  description = "ebsencryption"
  type        = string
}

*/

variable "stream" {
  description = "accountinfo"
  type        = string
}

/*
variable "aws_region" {
  description = "accountinfo"
  type        = string
}


variable "key_pair_id" {
  description = "accountinfo"
  type        = string
}

*/

variable "key_name" {
  description = "accountinfo"
  type        = string
}

variable "iam_instance_profile" {
  description = "accountinfo"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "accountinfo"
  type        = list(string)
}

/*
variable "network_interface_id" {
  description = "accountinfo"
  type        = string
}

*/

variable "availability_zone" {
  description = "accountinfo"
  type        = list(string)
}




variable "ami" {
  description = "accountinfo"
  type        = string
}


variable "name" {
  description = "accountinfo"
  type        = string
}


variable "public-subnet-ids" {
  description = "accountinfo"
  type        = list(string)
}