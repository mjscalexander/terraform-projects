variable "image" {
  description = "image for container"
  default = "ghost:latest"
}
variable "container_name" {
  description = "name of container"
  default = "blog"
}

variable "int_port" {
  description = "internal port for container"
  default = "2368"
}

variable "ext_port" {
  description = "external port for container"
  default = "80"
}


# Download the latest Ghost Image

resource "docker_image" "image_id" {
  name = "${var.image}"
}

# Start the container

resource "docker_container" "container_id" {
  name = "${var.container_name}"
  image = "${docker_image.image_id.latest}"

  ports {
    internal = "${var.int_port}"
    external = "${var.ext_port}"
  }
}

# Output name and ip address

output "ip address" {
  value = "${docker_container.container_id.ip_address}"
}

output "container_name" {
  value = "${docker_container.container_id.name}"
}