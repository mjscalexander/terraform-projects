# Download the latest Ghost Image

resource "docker_image" "image_id" {
  name = "ghost:latest"
}

# Start the container

resource "docker_container" "container_id" {
  name = "blog"
  image = "${docker_image.image_id.latest}"

  ports {
    internal = "2368"
    external = "80"
  }
}

# Output name and ip address

output "ip address" {
  value = "${docker_container.container_id.ip_address}"
}

output "container_name" {
  value = "${docker_container.container_id.name}"
}