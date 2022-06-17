#!/bin/bash

PACKAGE_VERSION=$(curl -s http://dl.google.com/linux/chrome/deb/dists/stable/main/binary-amd64/Packages | grep-dctrl -P google-chrome-stable -s Version -n /dev/stdin | sort -rV | head -1)
VERSION=$(echo $PACKAGE_VERSION | cut -d '-' -f1)

./set-arg.sh CHROME_VERSION $PACKAGE_VERSION
sed -i -E "s/^(\* Chrome) [[:digit:].]+$/\1 $VERSION/g" README.md

git commit -a -m "Upgrade Chrome to $VERSION"
