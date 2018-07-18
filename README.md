# Terraform-Packer SetUp

## Prerequisites

* Install Terraform  - <https://www.terraform.io/intro/getting-started/install.html>
* Install Packer     - <https://www.packer.io/intro/getting-started/install.html>

## Prerequisites - Before executing terraform, packer templates
* Update packer/templates-variable.json variable file
* Update Hybrid/terraform.tfvars variable file
* Update "key_path" with correct file_name in variable.tf file

### Build Packer separately 

* **On Linux** 
* packer --version
* packer --help
* cd to <packer templates path>
* packer build -var-file=templates-variable.json  templates.json          # For build the idential images

### Run Terraform separately 

* **On Linux**
* terraform --version
* cd to <terraform templates path>
* terraform init
* terraform  plan                  # For validating & creating infrastructure virtually
* terraform apply --auto-approve   # For creating the infrastruture 
* terraform destroy --force        # For dispose the infrastructure created by terraform

### Run Terraform-Packer as a appliance
* chmod +x run.sh
* ./run.sh workflow-hybrid

### References:
* https://www.terraform.io/
* https://www.packer.io/docs/index.html
