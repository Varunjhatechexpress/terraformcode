resource "aws_iam_role" "ipms_efs_ec2_role" {
  name = "ipms_efs_ec2_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
/*
  tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
  }
  */
}

  resource "aws_iam_policy" "efs_policy" {
  name        = "efs_policy"
  policy      = file("${path.module}/../../../../Common/efs_ec2_policy.json")
  description = "efs policy"
  }


resource "aws_iam_role_policy_attachment" "AmazonEC2FullAccess" {
  role       = aws_iam_role.ipms_efs_ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}


resource "aws_iam_instance_profile" "ec2-profile" {
  name = var.profile-name
  role       = aws_iam_role.ipms_efs_ec2_role.name
}
