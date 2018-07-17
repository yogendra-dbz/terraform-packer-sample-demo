# Provision AWS Nat instance to provide internet connectivity for private subnet VMs
resource "aws_instance" "nat" {
    count = "${var.is_nat_req == "Y" ? 1 : 0}"
    ami = "${lookup(var.amis-nat, var.aws_region)}"
    availability_zone = "${var.nat_availability_zone}"
    instance_type = "${var.nat_instance_type}"
    key_name = "${aws_key_pair.default.id}"
    vpc_security_group_ids = ["${aws_security_group.nat.id}"]
    subnet_id = "${aws_subnet.public.id}"
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "VPC NAT"
    }

    provisioner "local-exec" {
     command = "sleep 120"
    }
}

output "natinstanceip" {
  value = ["${aws_instance.nat.*.public_dns}"]  
}