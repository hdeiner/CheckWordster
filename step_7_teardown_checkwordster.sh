#!/usr/bin/env bash

figlet -w 160 -f standard "Teardown CheckWordster"

cd src/iac/terraform-checkwordster
terraform destroy -auto-approve
cd ../../..

rm ./.checkwordster_dns