#!/usr/bin/env bash


set -e;

cd  "$(dirname "$(dirname "$BASH_SOURCE")")"

export PATH="node_modules/.bin:${PATH}"

cd test
tsc -p tsconfig.test.json

for f in `(cd 'dist' && find . -type f)`; do
  node "dist/$f"
done

echo 'All tests exited with 0.'
echo 'Success'

exit 0;



