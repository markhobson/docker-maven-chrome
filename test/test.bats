#!/usr/bin/env bats

setup() {
	DOCKER_IMAGE=maven-chrome:${TAG:-latest}
}

@test "Can run browser test" {
	docker run --rm -it -v ${PWD}/test/test-project:/usr/src -w /usr/src $DOCKER_IMAGE mvn clean verify
}
