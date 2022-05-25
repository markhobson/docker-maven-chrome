# markhobson/maven-chrome

Docker image for Java automated UI tests.

Includes:

* JDK 8/11/17/18
* Maven 3.8.5
* Chrome 102
* ChromeDriver 101.0.4951.41

Available on [Docker Hub](https://hub.docker.com/r/markhobson/maven-chrome/).

## Tags

The following Docker tags are available:

* `jdk-8` [(jdk-8/Dockerfile)](jdk-8/Dockerfile)
* `jdk-11` [(jdk-11/Dockerfile)](jdk-11/Dockerfile)
* `jdk-17` [(jdk-17/Dockerfile)](jdk-17/Dockerfile)
* `jdk-18`, `latest` [(jdk-18/Dockerfile)](jdk-18/Dockerfile)

## Demo

See the [demo](demo) Maven project to see how this Docker image can be used to run UI tests. To run the demo within the latest version of this image on Docker Hub:

```bash
cd demo
./run.sh
```

## Tips

### Using with Selenium

Configure [Selenium](https://www.selenium.dev/) to launch Chrome in headless mode:

```java
ChromeOptions options = new ChromeOptions().setHeadless(true);
WebDriver driver = new ChromeDriver(options);
```

### Configure Protractor to use bundled ChromeDriver

To configure [Protractor](https://www.protractortest.org/) to use the version of ChromeDriver bundled in this image, set [`chromeDriver`](https://github.com/angular/protractor/blob/master/lib/config.ts#L76) in Protractor's `conf.js` file:

```js
exports.config = {
  chromeDriver: '/usr/bin/chromedriver'
}
```

### Chrome crashes

Chrome uses `/dev/shm` for runtime data which is 64MB by default under Docker. If this is not sufficient then this can cause [Chrome to crash](https://bugs.chromium.org/p/chromium/issues/detail?id=522853). Possible workarounds:

* Increase the size of `/dev/shm`
* Mount `/dev/shm` to the host's
* Start Chrome with the flag `--disable-dev-shm-usage`
