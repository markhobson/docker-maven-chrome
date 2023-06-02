#!/bin/bash

set -e -o pipefail

if [ $(git status --porcelain --untracked-files=no | wc -l) -ne 0 ]
then
  echo "Aborting: working directory has uncommitted changes"
  exit 1
fi

VERSION=$(curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE)

./set-arg.sh CHROME_DRIVER_VERSION $VERSION
sed -i -E "s/^(\* ChromeDriver) [[:digit:].]+$/\1 $VERSION/g" README.md

if [ $(git status --porcelain --untracked-files=no | wc -l) -ne 0 ]
then
  git commit -a -m "Upgrade ChromeDriver to $VERSION"
else
  echo "Already up-to-date"
fi
