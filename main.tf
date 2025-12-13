terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.0.0"
        }
    }
}

module "flaskr_app" {
    source = "./modules/flaskr_app"
    
    
}