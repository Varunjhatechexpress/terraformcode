resource "aws_iam_role" "ipms_ec2_role" {
  name = "ipms_ec2_role"

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

  tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
  }
}


/*
resource "aws_iam_policy" "policy" {
  name        = "ec2-ipms_policy"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = var. role
  policy_arn = var. policy_arn
}
*/

resource "aws_iam_instance_profile" "ec2-profile" {
  name = "ec2_profile"
  role = var.role
}


resource "aws_iam_policy" "ekslistpolicy" {
  name        = "ekslistpolicy"
  policy      = file("${path.module}/../../../../Common/ekslistpolicy.json")
  description = "My test policy"
  }

resource "aws_iam_role_policy_attachment" "ekslistpolicy" {
  role       = aws_iam_role.ipms_ec2_role.name
  policy_arn = "arn:aws:iam::565604140614:policy/ekslistpolicy"
}

resource "aws_iam_role_policy_attachment" "AmazonEC2RoleforSSM" {
  role       = aws_iam_role.ipms_ec2_role.name
  #for_each = toset(var.policy-arn-name)
  #policy_arn = each.value
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  
}


