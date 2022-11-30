#!/bin/bash

set -e -o pipefail

VERSION=$(curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE)

./set-arg.sh CHROME_DRIVER_VERSION $VERSION
sed -i -E "s/^(\* ChromeDriver) [[:digit:].]+$/\1 $VERSION/g" README.md

git commit -a -m "Upgrade ChromeDriver to $VERSION"
