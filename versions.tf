terraform {
  cloud {
    organization = "statgen"
    workspaces {
      name = "bravo-slurm-network"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }

  required_version = ">= 1.1.0"
}
