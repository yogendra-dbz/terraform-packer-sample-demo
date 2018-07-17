# Terraform-Packer SetUp

## Git cmds to clone and make changes

* git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/terraform-packer-sample-demo ( Enter credentials when prompted )
* Navigate to terraform-packer-sample-demo
* Execute `git init`
* Execute `git status`
* Change / Add a file 
* Execute `git status` , you should see your changes
* Execute `git add .`
* Execute `git commit -m "NewFile\ChangeFile"`
* Execute `git push -u origin master`

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

References:
https://www.terraform.io/
https://www.packer.io/docs/index.html
