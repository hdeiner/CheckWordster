#!/usr/bin/env bash

figlet -w 160 -f standard "Verify in Containers"

figlet -w 160 -f small "Starting WireMock"
docker-compose -f docker-compose-wiremock.yml up -d

figlet -w 160 -f small "Wait for WireMock to start"

while true ; do
  curl -s -d "{\"numberInDigits\": \"22\"}" -H "Content-Type: application/json" -X POST localhost:9001/checkWordster > temp.txt
  result=$(grep -c "Twenty two" temp.txt)
  if [ $result = 1 ] ; then
    echo "WireMock has started"
    break
  fi
  sleep 5
done
rm temp.txt

figlet -w 160 -f small "Starting CheckWordster"
docker-compose -f docker-compose-checkwordster.yml up -d

figlet -w 160 -f small "Wait for CheckWordster to start"

while true ; do
  curl -s -d "{\"numberInDigits\": \"22\"}" -H "Content-Type: application/json" -X POST localhost:9002/checkWordster > temp.txt
  result=$(grep -c "Twenty two" temp.txt)
  if [ $result = 1 ] ; then
    echo "CheckWordster has started"
    break
  fi
  sleep 5
done
rm temp.txt

figlet -w 160 -f small "Run Unit and Container Integration Tests"

mvn test

figlet -w 160 -f small "Shut Down WireMock and CheckWordster"

docker-compose -f docker-compose-wiremock.yml down
docker-compose -f docker-compose-checkwordster.yml down