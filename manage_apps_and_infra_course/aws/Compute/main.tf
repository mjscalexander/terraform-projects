#---- compute/maint.tf ----

# AMI
data "aws_ami" "server_ami" {
  most_recent = true

  filter {
    name = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name = "name"
    values = ["amzn-ami-hvm*-x86_64-gp2"]
  }
}

# template file
data "template_file" "user-init" {
  count = 2
  template = "${file("${path.module}/userdata.tpl")}"

  vars {
    firewall_subnets = "${element(var.subnet_ips, count.index)}"
  }
}

# Keypair
resource "aws_key_pair" "tf_auth" {
  key_name = "${var.keyname}"
  public_key = "${file(var.public_key_path)}"
}

# ec2 instances
resource "aws_instance" "tf_server" {
  count = "${var.instance_count}"
  instance_type = "${var.instance_type}"
  ami = "${data.aws_ami.server_ami.id}"

  tags {
    Name = "tf_server-${count.index + 1}"
  }

  key_name = "${aws_key_pair.tf_auth.id}"
  vpc_security_group_ids = ["${var.security_group}"]
  subnet_id = "${element(var.subnets, count.index )}"
  user_data = "${data.template_file.user-init.*.rendered[count.index]}"
}