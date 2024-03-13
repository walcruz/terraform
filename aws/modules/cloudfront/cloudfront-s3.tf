resource "aws_eks_cluster" "eks-cluster" {
  name     = var.settings["cluster_name"]
  role_arn = aws_iam_role.eks-cluster.arn
  version  = "1.18"

  vpc_config {
    endpoint_public_access  = false
    endpoint_private_access = true
    subnet_ids              = var.subnets #[for subnet in data.aws_subnet_ids.subnets.ids: subnet]
    security_group_ids      = [aws_security_group.secgroup.id]

  }

  depends_on = [
    aws_iam_role.eks-cluster,
  ]
  provisioner "local-exec" {
    command = "aws eks --region ${ var.settings.region } update-kubeconfig --name ${ var.settings.cluster_name } --profile ${ var.profile }"
  }
  # provisioner "local-exec" {
  #   command = "helm install spot-controller spotinst/spotinst-kubernetes-cluster-controller --set spotinst.token=${ var.spotToken } --set spotinst.account=${ var.settings.spotAccount } --set spotinst.clusterIdentifier=${ var.settings["cluster_name"] }"
  # }
}

data "aws_eks_cluster" "eks-cluster" {
    name     = var.settings["cluster_name"]
    depends_on = [aws_eks_cluster.eks-cluster]
}

data "aws_eks_cluster_auth" "eks-cluster" {
  name     = var.settings["cluster_name"]
}

output "clusterArn" {
  value = aws_eks_cluster.eks-cluster.arn
}