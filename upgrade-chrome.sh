#!/bin/bash

set -e -o pipefail

if [ $(git status --porcelain --untracked-files=no | wc -l) -ne 0 ]
then
  echo "Aborting: working directory has uncommitted changes"
  exit 1
fi

PACKAGE_VERSION=$(curl -s http://dl.google.com/linux/chrome/deb/dists/stable/main/binary-amd64/Packages | grep-dctrl -P google-chrome-stable -s Version -n /dev/stdin | sort -rV | head -1)
VERSION=$(echo $PACKAGE_VERSION | cut -d '-' -f1)

./set-arg.sh CHROME_VERSION $PACKAGE_VERSION
sed -i -E "s/^(\* Chrome) [[:digit:].]+$/\1 $VERSION/g" README.md

git commit -a -m "Upgrade Chrome to $VERSION"
