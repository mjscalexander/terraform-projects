# ----- ROOT ----

# from Storage/outputs.tf
output "Bucket Name" {
  value = "${module.storage.bucketname}"
}