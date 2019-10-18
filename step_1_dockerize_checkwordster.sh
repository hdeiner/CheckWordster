#!/usr/bin/env bash

figlet -w 160 -f standard "Terraform CheckWordster"

cp target/CheckWordster-0.0.1-SNAPSHOT.jar src/iac/docker-checkwordster/CheckWordster-0.0.1-SNAPSHOT.jar
docker build src/iac/docker-checkwordster -t howarddeiner/checkwordster
rm src/iac/docker-checkwordster/CheckWordster-0.0.1-SNAPSHOT.jar

docker login
docker push howarddeiner/checkwordster