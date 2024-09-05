#!/bin/bash

set -e -o pipefail

# jdk-11

docker build --pull -t maven-chrome:jdk-11 jdk-11
TAG=jdk-11 bats test

# jdk-17

docker build --pull -t maven-chrome:jdk-17 jdk-17
TAG=jdk-17 bats test

# jdk-21

docker build --pull -t maven-chrome:jdk-21 -t maven-chrome jdk-21
TAG=jdk-21 bats test
