resource "aws_eks_cluster" "ifx-stage-k8s-cluster" {
  #count           = length(var.subnet_ids)
  #depends_on = [aws_cloudwatch_log_group.example]
  #count             = length(var.enabled_cluster_log_types)
  name       = var.cluster_name
  version  = "1.24"
  role_arn = var.cluster_role
  enabled_cluster_log_types = var.enabled_cluster_log_types 
  #enabled_cluster_log_types = ["api","audit","authenticator","controllerManager","scheduler"]

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = false
    vpc_id                  = ""     
    subnet_ids = ["subnet-000ec6c8d264b8afb", "subnet-05e4539c702f3d6d6"]
    cluster_security_group_id = ""

    # ... other configuration ...
  }

  
    tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
    #deployment_type = var.deployment_type
  }

}


  # ... other configuration ...

   #Enable pod networking within your cluster.

resource "aws_eks_addon" "addon" {
  count             = length(var.addon_name)
  cluster_name      = aws_eks_cluster.ifx-stage-k8s-cluster.name
  addon_name        = var.addon_name[count.index]
  addon_version     = var.addon_version[count.index] #e.g., previous version v1.8.7-eksbuild.2 and the new version is v1.8.7-eksbuild.3
  #resolve_conflicts = "PRESERVE"
}


resource "aws_eks_node_group" "ifx-stage-k8s-nodegrp" {
  #count           = length(var.subnet_ids)
  cluster_name    = aws_eks_cluster.ifx-stage-k8s-cluster.name
  node_group_name = "ifx-stage-k8s-nodegrp"
  node_role_arn   = var.node_role_arn
  subnet_ids      = ["subnet-000ec6c8d264b8afb", "subnet-05e4539c702f3d6d6"]
  instance_types   =  ["t3.medium"]
  ami_type        = "AL2_x86_64"
  disk_size       = 30
  #source_security_group_ids = "sg-0477d24407bd4b8c5"
  #ec2_ssh_key_name   = "key-tf"
  #key_name       = "key-tf"
  capacity_type = "ON_DEMAND"
  #remote_access_security_group_id = "sg-0477d24407bd4b8c5"
  #security_group = "sg-0477d24407bd4b8c5"  
  #allow remote access to the nodes
  #allow remote access from all -in dev account
/*
  remote_access Configuration Block{
  ec2_ssh_key   = "key-tf"
  source_security_group_ids = ""
  }
  */
    tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
    #deployment_type = var.deployment_type
  }

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

}
