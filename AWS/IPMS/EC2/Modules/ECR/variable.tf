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


variable "ecr_name" {
  description = "The name of the ECR registry"
  type        = string
}

variable "image_mutability" {
  description = "Provide image mutability"
  type        = string
  
}


variable "encrypt_type" {
  description = "Provide type of encryption here"
  type        = string
  
}

/*
variable "tags" {
  description = "The key-value maps for tagging"
  type        = map(string)
  default     = {}
}
*/