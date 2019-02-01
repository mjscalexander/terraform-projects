# Output name and ip address

output "ip address" {
  value = "${module.container.ip}"
}

output "container_name" {
  value = "${module.container.container_name}"
}