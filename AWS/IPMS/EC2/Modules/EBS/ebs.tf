resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = "us-east-1b"
  size              = 20
 # key_arn           = "arn:aws:kms:us-east-1:565604140614:key/ce07079a-4551-4c00-b0c2-f1cba94e187d"
  type              = var.type
  kms_key_id           = var.key_arn
  encrypted         = true 


/*
 resource "aws_ebs_encryption_by_default" "example" {
  enabled = true
}
*/
  tags = {
    Name = "ebs-volume-terraform-demo"
  }
}

resource "aws_volume_attachment" "ebc_volume_attachment" {
  device_name = "/dev/xvda"
  volume_id   = var.volume_id
  instance_id = var.instance_id
}

/*dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      device_name           = ebs_block_device.value.device_name
      encrypted             = lookup(ebs_block_device.value, "encrypted", null)
      iops                  = lookup(ebs_block_device.value, "iops", null)
      kms_key_id            = lookup(ebs_block_device.value, "kms_key_id", null)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
      throughput            = lookup(ebs_block_device.value, "throughput", null)
    }
  }
  */