#!/usr/bin/env bash

figlet -w 160 -f standard "Verify in Containers"

figlet -w 160 -f small "Bring Docker Up"

docker-compose -f docker-compose-wiremock.yml up -d
sleep 30

docker-compose -f docker-compose-checkwordster.yml up -d
sleep 5

figlet -w 160 -f small "Run Unit and Container Integration Tests"

mvn test

figlet -w 160 -f small "Bring Docker Down"

docker-compose -f docker-compose-wiremock.yml down
docker-compose -f docker-compose-checkwordster.yml down