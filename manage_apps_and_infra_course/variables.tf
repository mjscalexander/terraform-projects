variable "env" {
  description = "env: dev or prod"
}

variable "image" {
  description = "image for container"
  type = "map"
}
variable "container_name" {
  description = "name of container"
  type = "map"
}

variable "int_port" {
  description = "internal port for container"
  type = "map"
}

variable "ext_port" {
  description = "external port for container"
  type = "map"
}