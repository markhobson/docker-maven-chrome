#!/bin/bash

DOCKER_IMAGE=markhobson/maven-chrome:jdk-8

docker pull $DOCKER_IMAGE
docker run --rm -it -v "$PWD":/usr/src -w /usr/src $DOCKER_IMAGE mvn clean verify
