Build Status at travis-ci.com<BR/>
[![Build Status](https://travis-ci.com/hdeiner/CheckWordster.svg?branch=master)](https://travis-ci.com/hdeiner/CheckWordster)

This project is about building microservices and properly testing them.

- The microservice is a simple one: take a string of characters for money and translate them into the corresponding string of words that you would put on a check.
- The code is built with unit tests. So that everyone can trust that the code is written well.
- The code is then tested with Gherkin statements, so other stakeholders can understand that the code does what it's supposed to do.
- The microservice is then tested against a fake server (WireMock, which allows beautiful URL request matching and response generation, and breaks the client/server dependency), brought up two different ways:
  - One method is to control the jar directly in the c=test code, which is great for Java development.
  - The other method demonstrated is to run WireMock inside a Docker Container, which will work on all systems and with all languages.
- And, finally, the same Gherkin tests are run against a locally hosted server.

The project is easy to run.  Either use the IDE to compile and then run the tests, or use Maven:
```bash
mvn clean compile test package
```

The uberjar produced by the package target in maven needs to be run on an AWS EC2 instance.

We then do integration testing on an  AWS EC2 instance.
```bash
./step_1_dockerize_checkwordster   # creates checkwordster image and pushes to DockerHub
./step_2_terraform_checkwordster   # creates EC2 instance using terraform
./step_3_provision_checkwordster   # uploads provisioning script to the EC2 instance and executes it
./step_4_verify_checkwordster      # executes mvn verify for integration testing against the EC2 REST server
./step_5_teardown_checkwordster    # destroy the EC2 artifacts using terraform
```
