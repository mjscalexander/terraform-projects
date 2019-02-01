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