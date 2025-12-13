# modules/prometheus/variables.tf
variable "network" {
  description = "Name of the Docker network"
  type = string
}

variable "flaskr_app_name" {
  description = "Name of the flask app"
  type = string
}

variable "app_port" {
    description = "Port of the application"
    type = number
    default = 5000
}
