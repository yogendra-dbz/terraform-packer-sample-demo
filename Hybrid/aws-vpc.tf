# Create VPC
resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "terraform-aws-vpc"
    }
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
}


# Create a subnet to launch our instances into
resource "aws_subnet" "public" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.public_subnet_cidr}"
    availability_zone = "${var.aws_region}a"

    tags {
        Name = "Public Subnet"
    }
}

# Attach internet gateway with route table
resource "aws_route_table" "public" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet"
    }
}

# Attach route table with subnet
resource "aws_route_table_association" "public" {
    subnet_id = "${aws_subnet.public.id}"
    route_table_id = "${aws_route_table.public.id}"
}

# Create private subnet
resource "aws_subnet" "private" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "${var.aws_region}a"

    tags {
        Name = "Private Subnet"
    }
}

# Create route table for private subnet
resource "aws_route_table" "private" {
    count = "${var.is_nat_req == "Y" ? 1 : 0}"
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${aws_instance.nat.id}"
    }

    tags {
        Name = "Private Subnet"
    }
}

# Attach route table with private subnet
resource "aws_route_table_association" "private" {
    count = "${var.is_nat_req == "Y" ? 1 : 0}"
    subnet_id = "${aws_subnet.private.id}"
    route_table_id = "${aws_route_table.private.id}"
}