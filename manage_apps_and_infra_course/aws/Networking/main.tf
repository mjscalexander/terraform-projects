#---- networking/main.tf ----

# grab availability zones
data "aws_availability_zones" "available" {}

# vpc
resource "aws_vpc" "tf_vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags {
    Name = "tf_vpc"
  }
}

# IGW
resource "aws_internet_gateway" "tf_ig" {
  vpc_id = "${aws_vpc.tf_vpc.id}"

  tags {
    Name = "IGW"
  }
}

# public route table
resource "aws_route_table" "tf_public_rt" {
  vpc_id = "${aws_vpc.tf_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.tf_ig.id}"
  }

  tags {
    Name = "tf_public"
  }
}

resource "aws_default_route_table" "tf_private_rt" {
  default_route_table_id = "${aws_vpc.tf_vpc.default_route_table_id}"

  tags {
    Name = "tf_private"
  }
}

# Subnets
resource "aws_subnet" "tf_public_subnets" {
  count = 2
  vpc_id = "${aws_vpc.tf_vpc.id}"
  cidr_block = "${var.public_cidrs[count.index]}"
  map_public_ip_on_launch = true
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name = "tf_public_${count.index + 1}"
  }
}

# Subnet Associations
resource "aws_route_table_association" "tf_public_assoc" {
  count = 2
  subnet_id = "${aws_subnet.tf_public_subnets.*.id[count.index]}"
  route_table_id = "${aws_route_table.tf_public_rt.id}"
}

# Security Group
resource "aws_security_group" "tf_public_sg" {
  name = "tf_public_sg"
  description = "Used for access to the public instances"
  vpc_id = "${aws_vpc.tf_vpc.id}"

  #SSH
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["${var.accessip}"]
  }

  #HTTP
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["${var.accessip}"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
















