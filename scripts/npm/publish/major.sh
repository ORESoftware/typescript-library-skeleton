#!/usr/bin/env bash

set -e;

my_args=( "$@" );
. "$(dirname "$(realpath "$0")")/.shared_tools.sh"

is_decreed="$(tsproject_match_arg "--decree" "${my_args[@]}")";

if [ "$is_decreed" != "yes" ]; then
  echo "must use the --decree argument to ensure this is what you really want to do.";
  echo "You are on the following git branch: ${ts_bold}$(git rev-parse --abbrev-ref HEAD)${ts_normal}"
  exit 1;
fi

# consider running tests before you publish, something like this:
# rm -rf node_modules
# npm install --production --loglevel=warn
# tsc
# npm test

npm version patch
git push --follow-tags
npm publish
