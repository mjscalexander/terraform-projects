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

# IG
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
    Name = "tf_default"
  }
}