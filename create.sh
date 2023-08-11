#!/usr/bin/env sh

# shellcheck disable=SC2039
if ! command -v nest &> /dev/null
then
    echo "nest could not be found. install with 'npm install --global @nestjs/cli'"
    exit
fi

MAX=$(
 # shellcheck disable=SC2164
 cd samples;
 # shellcheck disable=SC2035
 find * -type d -maxdepth 0 -mindepth 0 |
 awk '/^([0-9]+)\-.+$/ { printf("%d\n", $1) }' |
 sort -n |
 tail -n1
)

PROJECT_NAME=$1
NEXT=$((MAX + 1))
nest new -s -g -p npm --directory "samples/$(printf "%05d\n" $NEXT)-$PROJECT_NAME" "$PROJECT_NAME"
