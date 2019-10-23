#!/usr/bin/env bash

figlet -w 160 -f standard "Terraform CheckWordster"

cd src/iac/terraform-checkwordster
terraform init
terraform apply -auto-approve
echo `terraform output checkwordster_dns | grep -o '".*"' | cut -d '"' -f2` > ../../../.checkwordster_dns
cd ../../..

echo 'pause for 10 seconds'
sleep 10