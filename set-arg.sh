#!/bin/bash

set -e -o pipefail

if [ $# -ne 2 ]
then
	echo "Usage: set-arg.sh <arg-name> <arg-value>"
fi

ARG_NAME=$1
ARG_VALUE=$2

find . -name Dockerfile -exec sed -i "s/^ARG $ARG_NAME=.\+$/ARG $ARG_NAME=$ARG_VALUE/g" {} \;
