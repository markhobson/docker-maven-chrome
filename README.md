# markhobson/maven-chrome

Docker image for Java automated UI tests.

Includes:

* JDK 8/11
* Maven 3.6.1
* Chrome (latest)
* ChromeDriver 74

Available on [Docker Hub](https://hub.docker.com/r/markhobson/maven-chrome/).

## Tags

The following Docker tags are available:

* `latest` [(jdk-8/Dockerfile)](jdk-8/Dockerfile)
* `jdk-11` [(jdk-11/Dockerfile)](jdk-11/Dockerfile)

See issue [#11](https://github.com/markhobson/docker-maven-chrome/issues/11) to improve these tags.

## Demo

See the [demo](demo) Maven project to see how this Docker image can be used to run UI tests. The [run.sh](demo/run.sh) script builds the project within the latest version of this image on Docker Hub.
