#!/usr/bin/env bash

figlet -w 120 -f standard "Terraform Nancy"

cd src/iac/terraform-nancy
terraform init
terraform apply -auto-approve
echo `terraform output nancy_dns | grep -o '".*"' | cut -d '"' -f2` > ../../../.nancy_dns
cd ../../..

echo 'pause for 10 seconds'
sleep 10