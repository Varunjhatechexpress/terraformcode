################################################################################
# File System
################################################################################

resource "aws_efs_file_system" "efs_storage" {
  #count = var.create ? 1 : 0
  availability_zone_name          = var.availability_zone_name
  creation_token                  = var.creation_token
  performance_mode                = var.performance_mode
  encrypted                       = var.encrypted
  #kms_key_id                      = var.kms_key_arn
  provisioned_throughput_in_mibps = var.provisioned_throughput_in_mibps
  throughput_mode                 = var.throughput_mode

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

    tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
    Name       = var.name 
  }
}

resource "aws_efs_mount_target" "mount_target" {
  for_each = { for k, v in var.mount_targets : k => v if var.create }
  file_system_id = aws_efs_file_system.efs_storage.id
  subnet_id      = each.value.subnet_id
  #subnet_id       = [var.subnet_az1_id, var.subnet_az2_id]
  security_groups = var.security_groups

}

resource "aws_efs_file_system_policy" "policy" {
  file_system_id = aws_efs_file_system.efs_storage.id
  policy         = var.policy
}

resource "aws_efs_backup_policy" "policy" {
  file_system_id = aws_efs_file_system.efs_storage.id

  backup_policy {
    status = "ENABLED"
  }
}

