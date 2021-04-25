#!/bin/bash

docker build --pull -t maven-chrome:jdk-8 -t maven-chrome jdk-8 \
	&& docker build --pull -t maven-chrome:jdk-11 jdk-11 \
	&& docker build --pull -t maven-chrome:jdk-16 jdk-16
