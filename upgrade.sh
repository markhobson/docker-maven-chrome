#!/bin/bash

set -e -o pipefail

print_usage_and_exit () {
	echo "Usage: upgrade.sh [chrome | chromedriver]"
	exit 1
}

upgrade_chrome () {
  PACKAGE_VERSION=$(curl -s http://dl.google.com/linux/chrome/deb/dists/stable/main/binary-amd64/Packages \
    | grep-dctrl -P google-chrome-stable -s Version -n /dev/stdin \
    | sort -rV \
    | head -1)
  VERSION=$(echo $PACKAGE_VERSION | cut -d '-' -f1)

  check_clean
  set_arg CHROME_VERSION $PACKAGE_VERSION
  sed -i -E "s/^(\* Chrome) [[:digit:].]+$/\1 $VERSION/g" README.md
  git_commit "Upgrade Chrome to $VERSION"
}

upgrade_chromedriver () {
  VERSION=$(curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE)

  check_clean
  set_arg CHROME_DRIVER_VERSION $VERSION
  sed -i -E "s/^(\* ChromeDriver) [[:digit:].]+$/\1 $VERSION/g" README.md
  git_commit "Upgrade ChromeDriver to $VERSION"
}

check_clean () {
  if ! git_clean
  then
    echo "Aborting: working directory has uncommitted changes"
    exit 1
  fi
}

git_clean () {
  return $(git status --porcelain --untracked-files=no | wc -l)
}

set_arg () {
  ARG_NAME=$1
  ARG_VALUE=$2

  find . -name Dockerfile -exec sed -i "s/^ARG $ARG_NAME=.\+$/ARG $ARG_NAME=$ARG_VALUE/g" {} \;
}

git_commit () {
  MESSAGE=$1

  if git_clean
  then
    echo "Already up-to-date"
  else
    git commit -a -m "$MESSAGE"
  fi
}

if [ $# -ne 1 ]
then
  print_usage_and_exit
fi

PACKAGE=$1

case $PACKAGE in
  chrome)
    upgrade_chrome
    ;;
  chromedriver)
    upgrade_chromedriver
    ;;
  *)
    print_usage_and_exit
    ;;
esac
