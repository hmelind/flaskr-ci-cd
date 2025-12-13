output "container_name" {
  description = "Name of the first created container (string)"
  value       = docker_container.flaskr-terraform[0].name
}

output "container_names" {
  description = "List of created container names"
  value       = [for c in docker_container.flaskr-terraform : c.name]
}

output "container_ids" {
  description = "List of created container ids"
  value       = [for c in docker_container.flaskr-terraform : c.id]
}
