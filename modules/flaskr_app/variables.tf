variable "container_count" {
    description = "Number of containers"
    type = number
    default = 1
}

variable "container_name" {
    description = "Name of the Docker Container"
    type = string
    default = "flaskr-terraform"
}

variable "app_port" {
    description = "Port of the application"
    type = number
    default = 5000
}

variable "memory_limit" {
    description = "Memory limit"
    type = number
    default = 256
}