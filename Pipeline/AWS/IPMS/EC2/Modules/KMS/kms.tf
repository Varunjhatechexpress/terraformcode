resource "aws_kms_key" "ebsencryption" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
}

  /*tags = {
    stream = var.stream
  }
  */