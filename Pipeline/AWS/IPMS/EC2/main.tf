provider "aws" {
  region = "us-east-1"

}
            #######Backend configuration ######

/*
terraform {
  backend "s3" {
    bucket          = var.bucket
    key             = var.key
    region          = var.region
    dynamodb_table  = var.dynamodb_table
    encrypt         = var.encrypt
    }
}
*/
        ### ec2 creatation module ######
/*
module "create_ec2" {
  source = "./modules/ec2"
  #    aws_account        = var.aws_account
       aws_region         = var.aws_region
  stream = var.stream
  instance_type = "t2.small"
  vpc_id        = "vpc-04cd16e9c52b23d2f"
  #key_pair_id   = "key-0adc0739d4b345838"
  key_name      = "key-tf"
  vpc_security_group_ids ="sg-0907375ccbf376bbb"
  iam_instance_profile   ="ec2_profile"
  network_interface_id   = "eni-06baacfa522da4441"
  #cidr_blocks  = ["172.31.32.0/20", "172.31.64.0/20"]
} 
  
 /* 
module "create_ebs" {
  source = "./modules/ebs"
     #aws_account        = var.aws_account
      #aws_region         = var.aws_region
       stream = var.stream
       type   = "gp2"
       key_arn =   "arn:aws:kms:us-east-1:565604140614:key/ce07079a-4551-4c00-b0c2-f1cba94e187d"
       instance_id = "i-0ec4e9e4e655f7c8c"
       volume_id   = "vol-0bb2597621201ec7f"
  #kms_key_id   = ""
  #aws_ebs_volume = ["40","30"]
}




module "create_securitygroup" {
  source = "./modules/securitygroup"
  #    aws_account        = var.aws_account
      aws_region         = var.aws_region
      deploy_environment    = var.deploy_environment
  stream = var.stream
  #instance_type = "t2.micro"
  vpc_id        = "vpc-04cd16e9c52b23d2f"
  #cidr_blocks  = ["172.31.32.0/20", "172.31.64.0/20"]
}

/*

module "create_ec2_iam" {
  source = "./modules/IAM/ec2_iam"
  #    aws_account        = var.aws_account
       aws_region         = var.aws_region
       deploy_environment    = var.deploy_environment
  stream = var.stream
  #instance_type = "t2.micro"
   role           = "ipms_ec2_role"
  #policy_arn     = "arn:aws:iam::565604140614:policy/ec2-ipms_policy"
  #cidr_blocks  = ["172.31.32.0/20", "172.31.64.0/20"]
}

*/

/*
module "create_eks_iam_cluster" {
  source = "./Modules/IAM/eks_iam_cluster"
  #    aws_account        = var.aws_account
       aws_region         = var.aws_region
       deploy_environment = var.deploy_environment
       #deployment_type   = var.deployment_type 
        stream            = var.stream
        cluster_role      = "ipms_eks_cluster_role"

}



module "create_eks_iam_node" {
  source = "./Modules/IAM/eks_iam_node"
  #    aws_account        = var.aws_account
       aws_region         = var.aws_region
       deploy_environment = var.deploy_environment
       #deployment_type   = var.deployment_type 
       stream             = var.stream
       role_name          = "ipms_node_role"
 
}


module "create_EKS" {
  source = "./Modules/EKS"
  #    aws_account        = var.aws_account
       aws_region         = var.aws_region
       deploy_environment = var.deploy_environment
       #deployment_type    = var.deployment_type 
  stream = var.stream
  cluster_role          = module.create_eks_iam_cluster.role.arn
  node_role_arn = module.create_eks_iam_node.node_role.arn
  cluster_name  = "ifx-stage-k8s-cluster"
  addon_name    = ["vpc-cni","coredns","kube-proxy"]
  addon_version = ["v1.11.4-eksbuild.1","v1.8.7-eksbuild.3","v1.24.7-eksbuild.2"]
  enabled_cluster_log_types = ["api","audit","authenticator","controllerManager","scheduler"]
}
*/



module "create_ALB" {
  source = "./Modules/ELB/ALB"
  #    aws_account        = var.aws_account
       aws_region         = var.aws_region
       deploy_environment = var.deploy_environment
       #deployment_type    = var.deployment_type 
  stream = var.stream
  #instance_type = "t2.micro"
  #role           = "ipms_ec2_role"
  vpc_id        = "vpc-04cd16e9c52b23d2f"
  security_group_id = "sg-0477d24407bd4b8c5"
  subnet_az1_id     = "subnet-0233cbfd5307d7c71"
  subnet_az2_id     = "subnet-08c07f7fd1650526d"
  #policy_arn     = "arn:aws:iam::565604140614:policy/ec2-ipms_policy"
  #cidr_blocks  = ["172.31.32.0/20", "172.31.64.0/20"]
}

/*
module "create_NLB" {
  source = "./Modules/ELB/NLB"
  #    aws_account        = var.aws_account
       aws_region         = var.aws_region
       deploy_environment = var.deploy_environment
       #deployment_type    = var.deployment_type 
  stream = var.stream
  #instance_type = "t2.micro"
  #role           = "ipms_ec2_role"
  vpc_id        = "vpc-04cd16e9c52b23d2f"
  subnet_az1_id     = "subnet-0233cbfd5307d7c71"
  subnet_az2_id     = "subnet-08c07f7fd1650526d"
  #policy_arn     = "arn:aws:iam::565604140614:policy/ec2-ipms_policy"
  #cidr_blocks  = ["172.31.32.0/20", "172.31.64.0/20"]
}




module "create_ECR" {
  source = "./Modules/ECR"
  #    aws_account        = var.aws_account
       aws_region         = var.aws_region
       deploy_environment = var.deploy_environment
       #deployment_type   = var.deployment_type 
       stream             = var.stream
       ecr_name         = "ifx-stage-ecr"
      /* ecr_name         =  "infineon-devops-docker-image"  
       ecr_name         = "intg-assetsandmedia"   
       ecr_name         = "intg-common"
       ecr_name         = "intg-coveo"
       ecr_name         = "intg-eloqua"
       ecr_name         = "intg-idc"
       ecr_name         = "intg-khoros"
       ecr_name         = "intg-myicp"
       ecr_name         = "intg-umantis"
       ecr_name         = "ipms-core"
       ecr_name         = "test" 
       
       image_mutability = "MUTABLE"
       encrypt_type  = "KMS" 
       #encrypt_type  = "AES-256"
 
}
*/

