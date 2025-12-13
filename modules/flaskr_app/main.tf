
terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.0.0"
        }
    }
}

resource "docker_image" "flaskr-terraform" {
    name = "flaskr-app:latest"
    build {
        context = "."
        dockerfile = "Dockerfile_flaskr-dev-env"
        tag = ["flaskr-app:latest"]
        no_cache = true
    }
}

resource "docker_container" "flaskr-terraform" {
    count = var.container_count
    name = "${var.container_name}-${count.index + 1}"
    image = docker_image.flaskr-terraform.image_id
    
    ports {
        internal = var.app_port
        external = var.app_port + count.index
    }
    
    memory = var.memory_limit
}