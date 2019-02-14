# ----- root/outputs.tf ----

# from Storage/outputs.tf
output "Bucket Name" {
  value = "${module.storage.bucketname}"
}

# networking outputs

output "public_subnets" {
  value = "${join(", ", module.networking.public_subnets)}"
}

output "public_sg" {
  value = "${module.networking.public_sg}"
}

output "subnet_ips" {
  value = "${join(", ", module.networking.subnet_ips)}"
}

# compute outputs

output "public_instance_ids" {
  value = "${module.compute.server_id}"
}

output "public_instance_ips" {
  value = "${module.compute.server_ip}"
}
