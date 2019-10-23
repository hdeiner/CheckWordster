#!/usr/bin/env bash

figlet -w 160 -f standard "Dockerize CheckWordster"

figlet -w 160 -f small "Clean, Compile, and Jar"

mvn clean compile

figlet -w 160 -f small "Build Docker Image"

docker rmi howarddeiner/checkwordster

cp target/CheckWordster-0.0.1-SNAPSHOT-jar-with-dependencies.jar src/iac/docker-checkwordster/CheckWordster-0.0.1-SNAPSHOT-jar-with-dependencies.jar
docker build src/iac/docker-checkwordster -t howarddeiner/checkwordster
rm src/iac/docker-checkwordster/CheckWordster-0.0.1-SNAPSHOT-jar-with-dependencies.jar

