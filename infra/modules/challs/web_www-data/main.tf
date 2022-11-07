resource "kubernetes_ingress_v1" "ingress" {
  metadata {
    name = "web-${var.name}-ingress"
    namespace = var.k8s_namespace

    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
  spec {
    rule {
      host = var.hostname
      http {
        path {
          path = "/"
          backend {
            service {
              name = kubernetes_service.service.metadata.0.name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "service" {
  metadata {
    name = "web-${var.name}-service"
    namespace = var.k8s_namespace
  }
  spec {
    selector = {
      app = kubernetes_deployment.deployment.spec.0.template.0.metadata.0.labels.app
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_deployment" "deployment" {
  metadata {
    name = "web-${var.name}-deployment"
    namespace = var.k8s_namespace
    labels = {
      app = "${var.name}"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "${var.name}"
      }
    }

    template {
      metadata {
        labels = {
          app = "${var.name}"
        }
      }

      spec {
        container {
          image = "${var.k8s_image}"
          name  = "${var.name}"

          resources {
            limits = {
              cpu    = "0.3"
              memory = "512Mi"
            }
            requests = {
              cpu    = "0.1"
              memory = "128Mi"
            }
          }
        }

        image_pull_secrets {
          name = var.k8s_registry_secret
        }
      }
    }
  }
}
