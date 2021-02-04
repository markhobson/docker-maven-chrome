# markhobson/maven-chrome

Docker image for Java automated UI tests.

Includes:

* JDK 8/11/15
* Maven 3.6.3
* Chrome 88
* ChromeDriver 87

Available on [Docker Hub](https://hub.docker.com/r/markhobson/maven-chrome/).

## Tags

The following Docker tags are available:

* `jdk-8`, `latest` [(jdk-8/Dockerfile)](jdk-8/Dockerfile)
* `jdk-11` [(jdk-11/Dockerfile)](jdk-11/Dockerfile)
* `jdk-15` [(jdk-15/Dockerfile)](jdk-15/Dockerfile)

**Note: Please use `jdk-8` instead of `latest`, as `latest` will be switched to `jdk-15` soon.** See issue [#11](https://github.com/markhobson/docker-maven-chrome/issues/11) for more information.

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
