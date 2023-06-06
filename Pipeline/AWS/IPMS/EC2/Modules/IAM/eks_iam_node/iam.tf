resource "aws_iam_role" "ipms_eks_node_role" {
  name = var.role_name

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
    #deployment_type = var.deployment_type
  }
}


resource "aws_iam_policy" "AWSLoadBalancerControllerIAMPolicy" {
  name        = "AWSLoadBalancerControllerIAMPolicy"
  policy      = file("${path.module}/../../../../Common/AWSLoadBalancerControllerIAMPolicy.json")
  description = "My test policy"
  }

resource "aws_iam_role_policy_attachment" "AWSLoadBalancerControllerIAMPolicy" {
  role       = aws_iam_role.ipms_eks_node_role.name
  policy_arn = aws_iam_policy.AWSLoadBalancerControllerIAMPolicy.arn
}

resource "aws_iam_policy" "infineon-ecr-nodes" {
  name        = "infineon-ecr-nodes"
  policy      = file("${path.module}/../../../../Common/infineon-ecr-nodes.json")
  description = "My test policy"
  }

resource "aws_iam_role_policy_attachment" "infineon-ecr-nodes" {
  role       = aws_iam_role.ipms_eks_node_role.name
  policy_arn = aws_iam_policy.infineon-ecr-nodes.arn
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  role       = aws_iam_role.ipms_eks_node_role.name
  #for_each = toset(var.policy-arn-name)
  #policy_arn = each.value
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  
}


resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  role       = aws_iam_role.ipms_eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  role       = aws_iam_role.ipms_eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "AmazonRDSFullAccess" {
  role       = aws_iam_role.ipms_eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

resource "aws_iam_role_policy_attachment" "AWSAppMeshEnvoyAccesss" {
  role       = aws_iam_role.ipms_eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSAppMeshEnvoyAccess"
}


