#!/usr/bin/env bash

# First, add the GPG key for the official Docker repository to the system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Next, update the package database with the Docker packages from the newly added repo:
sudo apt-get -qq update

# Install Docker
sudo apt-get -qq install -y docker-ce

echo "Start CheckWordster"
sudo docker network create -d bridge mynetwork
sudo docker run -d -p 80:9002 --network=mynetwork --name checkwordster howarddeiner/checkwordster

# A small delay to digest
sleep 5
