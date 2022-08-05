 provider "kubernetes" {
  config_context_cluster   = "minikube"
}
 
 resource "kubernetes_namespace" "_1-minikube-namespace" {
  metadata {
        name = "my-first-terraform-namespace"
  }
} 


locals {
    # get json 
    applications_data = jsondecode(file("${path.module}/applications.json"))

    # get all applications
    all_applications = [for application in local.applications_data.applications : application.name]
}

output "application" {
    value = local.all_applications
}
