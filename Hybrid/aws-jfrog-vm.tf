#Search the Jfrog AMI created by packer
data "aws_ami" "packer_jfrog_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["jfrog-ubuntu-16.04-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["${var.owner}"]
}

# Launch the Jfrog instance
resource "aws_instance" "jfrog" {
  count = "${var.is_jfrog_req == "Y" ? 1 : 0}"
  ami = "${data.aws_ami.packer_jfrog_ami.id}"
  instance_type = "${var.jfrog_instance_type}"
  key_name = "${aws_key_pair.default.id}"
  vpc_security_group_ids = ["${aws_security_group.web.id}"]
  availability_zone = "${var.jfrog_availability_zone}"
  subnet_id = "${aws_subnet.public.id}"
  associate_public_ip_address = true
  source_dest_check = false

  tags {
    Name  = "Jfrog Artifactory"
  }
  
   provisioner "local-exec" {
    command = "sleep 120"
  }
    
}

output "jfrogip" {
  value = ["${aws_instance.jfrog.*.public_dns}"]
}


