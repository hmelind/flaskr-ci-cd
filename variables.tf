# variables.tf
variable "project_name" {
    description = "The name of the project"
    type = string
    default = "flaskr-ci-cd"
}

variable "container_name" {
    description = "Name of the Docker Container"
    type = string
    default = "flaskr-terraform"
}