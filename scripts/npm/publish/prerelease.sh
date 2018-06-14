#!/usr/bin/env bash

set -e;

my_args=( "$@" );

# load shared utilities
. "$(dirname "$(realpath "$0")")/.shared_tools.sh"

# first we run basic checks/validation
if ! tsproject_run_checks "${my_args[@]}"; then
   echo "A validation routine failed. Please check your system.";
   exit 1;
fi

# consider running some tests before you publish, something like this:
# rm -rf node_modules
# npm install --production --loglevel=warn
# tsc
# npm test

zmx npm version prerelease
zmx xgit push --follow-tags

if ! tsproject_match_arg "--no-publish" "${my_args[@]}"; then
    zmx npm publish
fi
