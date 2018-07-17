###### AWS section start

variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}
variable "aws_security_token" {}
variable "owner" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-east-1"
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.1.0/24"
}

variable "key_path" {
  description = <<DESCRIPTION
    Path to the SSH public key to be used for authentication.
    Ensure this keypair is added to your local SSH agent so provisioners can
    connect.
    Example: ~/.ssh/terraform.pub
    DESCRIPTION
  default = "id_rsa.pub"

}

variable "key_name" {
  description = "SSH Public Key name"
  default = "terraform_devops"
}

resource "aws_key_pair" "default"{
  key_name = "${var.key_name}" 
  public_key = "${file("${var.key_path}")}"
}

###### AWS section end
###### AZURE section start

variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "subscription_id" {}

variable "computer_name" {
  description = "Machine_name"
  default = "Jenkins"
}

variable "admin_username" {
  description = "Machine_user_name"
  default = "adminis"
}

variable "admin_password" {
  description = "Machine_password"
  default = "Password1234!"
}

variable "resource_group" {
  description = "Resource Group"
}

variable "vm_size" {
  description = "Virtual Machine size"
}

###### AZURE section end
###### Datadog section start

variable "datadog_api_key" {}
variable "datadog_app_key" {}

###### Datadog section end
###### Jfrog section start

variable "is_jfrog_req" {
  type    = "string"
  default = "N"
}

variable "jfrog_instance_type" {
  description = "Instance type"
  default = "t2.small"
}

variable "jfrog_availability_zone" {
  default = "us-east-1a"
}

###### Jfrog section end
###### Nat instance section start

variable "is_nat_req" {
  type    = "string"
  default = "N"
}

variable "amis-nat" {
    description = "AMIs by region"
    default = {
        us-east-1 = "ami-8d7655f7" # this is a special ami preconfigured to do NAT
    }
}

variable "nat_availability_zone" {
  default = "us-east-1a"
}

variable "nat_instance_type" {
  description = "Instance type"
  default = "m1.small"
}

###### Nat instance section end
###### Sonar section start

variable "is_sonarqube_req" {
  type    = "string"
  default = "N"
}

variable "sonarqube_instance_type" {
  description = "Instance type"
  default = "t2.small"
}

variable "sonarqube_availability_zone" {
  default = "us-east-1a"
}


###### Sonar section end




