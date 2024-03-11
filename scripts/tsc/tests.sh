#!/usr/bin/env bash

set -eo pipefail;

if [[ ! -f package.json ]]; then
  echo 'wrong pwd, check your directory';
  exit 1;
fi

cd test && pwd;
tsc -p tsconfig.test.json --watch
