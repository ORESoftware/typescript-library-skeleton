#!/usr/bin/env bash

set -e;

# consider running tests before you publish, something like this:
# rm -rf node_modules
# npm install --production --loglevel=warn
# tsc
# npm test

npm version patch
git push --follow-tags
npm publish
