# ---- networking/outputs.tf ----

output "public_subnets" {
  value = "${aws_subnet.tf_public_subnets.*.id}"
}

output "public_sg" {
  value = "${aws_security_group.tf_public_sg.id}"
}

output "subnet_ips" {
  value = "${aws_subnet.tf_public_subnets.*.cidr_block}"
}