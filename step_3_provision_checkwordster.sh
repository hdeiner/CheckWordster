#!/usr/bin/env bash

figlet -w 160 -f standard "Provision CheckWordster"

export CHECKWORDSTER_DNS=$(echo `cat ./.checkwordster_dns`)

echo "upload: provision_checkwordster_ec2.sh' to /home/ubuntu/provision.sh"
bolt file upload 'provision_checkwordster_ec2.sh' '/home/ubuntu/provision.sh' --nodes $CHECKWORDSTER_DNS --user 'ubuntu' --no-host-key-check

echo "remote execution: chmod +x /home/ubuntu/provision.sh"
bolt command run 'chmod +x /home/ubuntu/provision.sh' --nodes $CHECKWORDSTER_DNS --user 'ubuntu' --no-host-key-check

echo "remote execution: /home/ubuntu/provision.sh"
bolt command run '/home/ubuntu/provision.sh' --nodes $CHECKWORDSTER_DNS --user 'ubuntu' --no-host-key-check