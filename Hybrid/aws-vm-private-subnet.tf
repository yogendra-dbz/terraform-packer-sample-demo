# Variable for Database Server in private subnet
variable "is_database_vm_req" {
  type    = "string"
  default = "N"
}

variable "amis-database" {
    description = "AMIs by region"
    default = {
        us-east-1 = "ami-a4dc46db" # ubuntu 16.04 LTS
    }
}

variable "database_availability_zone" {
  default = "us-east-1a"
}

variable "database_instance_type" {
  description = "Instance type"
  default = "t2.small"
}

# Launch Instance in private subnet
resource "aws_instance" "db-1" {
    count = "${var.is_database_vm_req == "Y" ? 1 : 0}"
    ami = "${lookup(var.amis-database, var.aws_region)}"
    availability_zone = "${var.database_availability_zone}"
    instance_type = "${var.database_instance_type}"
    key_name = "${aws_key_pair.default.id}"
    vpc_security_group_ids = ["${aws_security_group.db.id}"]
    subnet_id = "${aws_subnet.private.id}"
    source_dest_check = false

    tags {
        Name = "DB Server 1"
    }
}


output "databaseip" {
  value = ["${aws_instance.db-1.*.private_ip}"]
}