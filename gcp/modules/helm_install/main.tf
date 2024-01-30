resource "helm_release" "helm" {
  name       = var.helm_name
  repository = var.helm_repository
  chart      = var.helm_chart
  version    = var.helm_version
  namespace  = var.helm_namespace

  values = [
    templatefile(var.helm_values, {}),
  ]
}