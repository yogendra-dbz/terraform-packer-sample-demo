#!/bin/sh

if [ $# -eq 0 ]; then
   echo "No arguments provided"
   echo "Please choose from below option"
   echo "./run.sh workflow-hybrid"
   exit 1
fi

case "$1" in
   "workflow-hybrid")
    packer build -var-file=packer/templates-variable.json  packer/templates.json
    cd Hybrid
    terraform apply --auto-approve
    cd ..
   ;;
   "delete-workflow-hybrid")
    cd Hybrid
    terraform destroy --force
    cd ..
   ;;
   "plan-workflow-hybrid")
    cd Hybrid
    terraform destroy --force
    cd ..
   ;;
   *) echo "Invalid Option"
   echo "Please choose from below option"
   echo "./run.sh workflow-hybrid"
   ;;
esac
