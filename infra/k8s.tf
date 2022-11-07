resource "kubernetes_secret" "acr" {
  metadata {
    name = "acr"
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "frictf2022.azurecr.io" = {
          "auth"     = base64encode("${var.azure_client_id}:${var.azure_client_secret}")
        }
      }
    })
  }
}

module "nginx-controller" {
  source  = "terraform-iaac/nginx-controller/helm"
  version = "2.0.4"
}
