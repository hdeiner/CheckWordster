#!/usr/bin/env bash

figlet -w 160 -f standard "Push Images"

docker login

figlet -w 160 -f small "Push CheckWordster Image"

docker push howarddeiner/checkwordster