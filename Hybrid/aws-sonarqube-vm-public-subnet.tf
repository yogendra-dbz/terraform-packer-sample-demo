# Search image created by packer
data "aws_ami" "packer_sonar_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["sonar-ubuntu-16.04-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["${var.owner}"]
}

# Provision Sonarqube instance
resource "aws_instance" "soanrqube" {
  count = "${var.is_sonarqube_req == "Y" ? 1 : 0}"
  ami = "${data.aws_ami.packer_sonar_ami.id}"
  instance_type = "${var.sonarqube_instance_type}"
  key_name = "${aws_key_pair.default.id}"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]
  availability_zone = "${var.sonarqube_availability_zone}"
  subnet_id = "${aws_subnet.public.id}"
  associate_public_ip_address = true
  source_dest_check = false


  tags {
    Name  = "Sonarqube Server"
  }

  provisioner "local-exec" {
    command = "sleep 120"
  }
  
}

output "soanrqubeip" {
  value = ["${aws_instance.soanrqube.*.public_dns}"]
}

