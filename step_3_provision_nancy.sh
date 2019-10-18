#!/usr/bin/env bash

figlet -w 160 -f standard "Provision Nancy"

export NANCY_DNS=$(echo `cat ./.nancy_dns`)

echo "upload: provision_nancy_ec2.sh' to /home/ubuntu/provision.sh"
bolt file upload 'provision_nancy_ec2.sh' '/home/ubuntu/provision.sh' --nodes $NANCY_DNS --user 'ubuntu' --no-host-key-check

echo "remote execution: chmod +x /home/ubuntu/provision.sh"
bolt command run 'chmod +x /home/ubuntu/provision.sh' --nodes $NANCY_DNS --user 'ubuntu' --no-host-key-check

echo "remote execution: /home/ubuntu/provision.sh"
bolt command run '\/home/ubuntu/provision.sh' --nodes $NANCY_DNS --user 'ubuntu' --no-host-key-check