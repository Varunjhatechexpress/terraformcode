output "role" {
  description = "cluster role name"
  value       = aws_iam_role.ipms_eks_cluster_role
}