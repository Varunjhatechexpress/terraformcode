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


/*
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
*/

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
       ecr_name         = "ipms-core"
       image_mutability = "MUTABLE"
       encrypt_type  = "KMS" 
       #encrypt_type  = "AES-256"
 
}
*/

module "create_efs_ec2_securitygroup" {
  source = "./modules/securitygroup/efs_ec2_sg"
  #    aws_account        = var.aws_account
      #aws_region         = var.aws_region
      #deploy_environment    = var.deploy_environment
  #stream = var.stream
  #instance_type = "t2.micro"
  vpc_id        = "vpc-04cd16e9c52b23d2f"
  #cidr_blocks  = ["172.31.32.0/20", "172.31.64.0/20"]
}


module "create_efs_securitygroup" {
  source = "./modules/securitygroup/efs_sg"
  #    aws_account        = var.aws_account
     # aws_region         = var.aws_region
     # deploy_environment    = var.deploy_environment
  #stream = var.stream
  #instance_type = "t2.micro"
  vpc_id        = "vpc-04cd16e9c52b23d2f"
  security_group_id = module.create_efs_ec2_securitygroup.efs_ec2_sg
  #cidr_blocks  = ["172.31.32.0/20", "172.31.64.0/20"]
  depends_on = [  module.create_efs_ec2_securitygroup]
}



module "create_efs" {
  source = "./Modules/EFS"
  #    aws_account        = var.aws_account
       aws_region         = var.aws_region
       deploy_environment = var.deploy_environment
       name               = "ifx-stg-efs"
       #deployment_type   = var.deployment_type 
       stream             = var.stream
 #      availability_zone_name = ["us-east-1a", "us-east-1b"]
       creation_token         = "efs_storage"
       performance_mode       = "maxIO"
       encrypted              = true
       #kms_key_arn            = 
      provisioned_throughput_in_mibps  = 30
      throughput_mode         = "provisioned"
#      subnet_id               = ["subnet-0e541287fe7664e82","subnet-000ec6c8d264b8afb"]
      #subnet_az1_id       = "subnet-0e541287fe7664e82"
      #subnet_az2_id       = "subnet-000ec6c8d264b8afb"
      policy              = file("${path.root}./Common/efs_policy.json")
      security_groups     = [module.create_efs_securitygroup.efs_sg]
        # Mount targets / security group
      mount_targets = {
       "us-east-1a" = {
        subnet_id = "subnet-0e541287fe7664e82"
      }
       "us-east-1b" = {
        subnet_id = "subnet-000ec6c8d264b8afb"
      }
  }

}


module "ec2-instance-profile" {
  source       = "./modules/IAM/efs_ec2_iam"
 # application-id       = var.application-id
  # deploy-environment  = var.deploy-environment
   #stream              = var.stream
   #deployment-type     = var.deployment-type
   #target-account      = var.target-account
   profile-name         = "efs-ec2-instance-profile"
}



module "create_ec2" {
  source = "./modules/ec2/redhat-ec2"
  #application-id        = var.application-id
   #deploy-environment   = var.deploy-environment
   stream               = var.stream
   #deployment-type      = var.deployment-type
   #target-account       = var.target-account
  instance_type         = "t4g.small"
  #vpc_id               = "vpc-04cd16e9c52b23d2f"
  #key_pair_id          = "key-0adc0739d4b345838"
  key_name              = "key-stag-tf"
  #public-subnet-ids     = module.my-vpc.public-subnet-ids[0]
  iam_instance_profile  = module.ec2-instance-profile.instance-profile
  vpc_security_group_ids= [module.create_efs_ec2_securitygroup.efs_ec2_sg]
  ami                   = "ami-0299d82d412b669b3"
  name                  = "efs_ec2"
  availability_zone     =  ["us-east-1a", "us-east-1b"]
  public-subnet-ids     = ["subnet-0e541287fe7664e82","subnet-000ec6c8d264b8afb"]
  #network_interface_id   = "eni-06baacfa522da4441"
  #cidr_blocks  = ["172.31.32.0/20", "172.31.64.0/20"]
}
