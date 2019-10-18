#!/usr/bin/env bash

figlet -w 120 -f standard "Teardown Nancy"

cd src/iac/terraform-nancy
terraform destroy -auto-approve
cd ../../..

rm ./.nancy_dns