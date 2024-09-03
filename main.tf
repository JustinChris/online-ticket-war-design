terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "sage-passkey-430603-j7"
  region = "us-central1-a"
}

resource "google_container_cluster" "my_cluster" {
  name               = "cluster-dev"
  location           = "us-central1"
  initial_node_count = 1

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

# output "kubeconfig" {
#   value = google_container_cluster.my_cluster.kube_config.raw_kube_config
# }

# provider "helm" {
#   kubernetes {
#     config_path = google_container_cluster.my_cluster.kube_config_raw
#   }
# }

# resource "helm_release" "argo_cd" {
#   name       = "argo-cd"
#   repository = "https://argoproj.github.io/argo-helm"
#   chart      = "argo-cd"
#   version    = "5.0.0"

#   depends_on = [google_container_cluster.my_cluster]
# }

# output "argo_cd_server_url" {
#   value = "https://$(kubectl get svc argocd-server -n argocd -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')"
# }

# output "argo_cd_admin_password" {
#   value = "kubectl get secret argocd-secret -n argocd -o jsonpath='{.data.admin.password}' | base64 --decode"
# }