provider "aws" {
  access_key = "${secrets.AWS_ACCESS_KEY_ID}"
  secret_key = "${secrets.AWS_SECRET_ACCESS_KEY}" 
  region = "eu-north-1"
}

terraform {
  required_providers {
    kubectl = {
        source = "gavinbunney/kubectl"
        version = ">= 1.14.0"
  }
    helm = {
        source = "hashicorp/helm"
        version = ">= 2.6.0"
  }
}
    required_version = "~> 1.0"
}