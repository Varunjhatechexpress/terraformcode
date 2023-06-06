variable "stream" {
  description = "accountinfo"
  type        = string
}

variable "deploy_environment" {
  description = "env"
  type        = string
}

variable "aws_region" {
  description = "location"
  type        = string
}


variable "role_name" {
  description = "this for eks role name"
  type        = string
}



/*
variable "policy-arn-name" {
  type = list(string)
  description = "List of values for policy."
  default = ["arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy", "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly", "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"]
}


variable "policy_arn" {
  description = "ec2policy"
  type        = string
}

*/
