#!/usr/bin/env bash

set -eo pipefail;
export PATH="node_modules/.bin:${PATH}"

cd test && pwd
tsc -p tsconfig.test.json

for f in `(cd 'dist' && find . -type f)`; do
  node "dist/$f"
done

echo 'All tests exited with 0.'
echo 'Success'

exit 0;



