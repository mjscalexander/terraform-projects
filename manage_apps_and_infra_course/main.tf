# Download the latest Ghost Image

resource "docker_image" "image_id" {
  name = "ghost:latest"
}