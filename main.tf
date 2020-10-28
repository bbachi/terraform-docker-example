terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
      version = "~> 2.3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "angular-node-webapp" {
  name         = var.docker_image
  keep_locally = false
}

resource "docker_container" "angular-webapp" {
  image = docker_image.angular-node-webapp.latest
  name  = var.container_name
  ports {
    internal = 3080
    external = 8080
  }
}

output "container_name" {
  value = docker_container.angular-webapp.name
}