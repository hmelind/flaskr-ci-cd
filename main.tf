terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.0.0"
        }
    }
}

provider "docker" {
    host = "unix:///var/run/docker.sock"
}

resource "docker_network" "monitoring_network" {
    name = "${var.project_name}-network"
    driver = "bridge"
    ipam_config {
        subnet = "172.18.0.0/16"
        gateway = "172.18.0.1"
    }
    internal = false
}

module "flaskr_app" {
    source = "./modules/flaskr_app"

    container_name = "${var.project_name}-flaskr"
    network = docker_network.monitoring_network.name
    
    depends_on = [docker_network.monitoring_network]
    
}

module "prometheus" {
    source = "./modules/prometheus"
    
    network = docker_network.monitoring_network.name
    flaskr_app_name = module.flaskr_app.container_name
}

output "network_info" {
    value = {
        network_id = docker_network.monitoring_network.id
        network_name = docker_network.monitoring_network.name
    }
}