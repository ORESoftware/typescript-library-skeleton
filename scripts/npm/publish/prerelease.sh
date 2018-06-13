#!/usr/bin/env bash

set -e;

my_args=( "$@" );
. "$(dirname "$(realpath "$0")")/.shared_tools.sh"

# consider running some tests before you publish, something like this:

# rm -rf node_modules
# npm install --production --loglevel=warn
# tsc
# npm test

npm version prerelease
git push --follow-tags
npm publish
