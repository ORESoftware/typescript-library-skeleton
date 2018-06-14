#!/usr/bin/env bash

set -e;

my_args=( "$@" );

# load shared utilities
. "$(dirname "$(realpath "$0")")/.shared_tools.sh";

if ! tsproject_match_arg "--decree" "${my_args[@]}"; then
    echo "You must use the --decree argument to ensure this command is what you really want to do.";
    exit 1;
fi

if ! tsproject_run_checks "${my_args[@]}"; then
   echo "A validation routine failed. Please check your system.";
   exit 1;
fi


# consider running tests before you publish, something like this:
# rm -rf node_modules
# npm install --production --loglevel=warn
# tsc
# npm test

zmx npm version minor
zmx git push --follow-tags
zmx npm publish
