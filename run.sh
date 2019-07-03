#!/bin/sh

set -o nounset \
    -o errexit

if [ $# -ne 0 ]; then
  echo "Loding environment varibles..."
  for var in "$@"
  do
    export "$var"
  done
fi

echo "Building application..."
echo Y | yarn build
# npm install -g serve

echo "Starting application..."
# serve -s /app/build -l tcp://0.0.0.0:3000
yarn start 