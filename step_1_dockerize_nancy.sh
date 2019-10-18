#!/usr/bin/env bash

cp target/CheckWordster-0.0.1-SNAPSHOT.jar src/iac/docker-nancy/CheckWordster-0.0.1-SNAPSHOT.jar
docker build src/iac/docker-nancy -t howarddeiner/checkwordster
rm src/iac/docker-nancy/CheckWordster-0.0.1-SNAPSHOT.jar

docker login
docker push howarddeiner/checkwordster