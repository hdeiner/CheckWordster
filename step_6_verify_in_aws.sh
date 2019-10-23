#!/usr/bin/env bash

figlet -w 160 -f standard "Verify in AWS"

figlet -w 160 -f small "Run Integration Tests in AWS"

mvn failsafe:integration-test



