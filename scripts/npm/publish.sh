#!/usr/bin/env bash

set -e;

my_args=( "$@" );
first_arg="$1";

if ! [[ ${first_arg} =~ ^(patch|major|minor|prerelease)$ ]]; then
    echo "First argument needs to match a valid npm version argument (patch, minor, major, etc)." >&2;
    exit 1;
fi

ts_bold="$(tput bold)"
ts_normal="$(tput sgr0)"
zmx_gray='\033[1;30m'
zmx_magenta='\033[1;35m'
zmx_cyan='\033[1;36m'
zmx_orange='\033[1;33m'
zmx_yellow='\033[1;33m'
zmx_green='\033[1;32m'
zmx_no_color='\033[0m'


tsproject_match_arg(){
    # checks to see if the first arg, is among the remaining args
    # for example  ql_match_arg --json --json # yes
    first_item="$1"; shift;
    for var in "$@"; do
        if [[ "$var" == "$first_item" ]]; then
          return 0;
        fi
    done
    ## we have not given the decree so we fail now
    return 1;
}

tsproject_run_checks(){

  local branch="$(git rev-parse --abbrev-ref HEAD)"

  if ! tsproject_match_arg "--any-branch" "${my_args[@]}"; then
    if [ "$branch" != "master" ]; then
        echo -e "${zmx_yellow} => Current branch is not master => instead we have: '$branch'.${zmx_no_color}";
        return 1;
    fi
  fi

}


echo -e " ${zmx_gray}[tsls]${zmx_no_color} running NPM publish routine."

zmx(){
    local v1="$1"; local v2="$2"; "$@"  \
    2> >( while read line; do echo -e "${zmx_magenta} [${v1} ${v2}] ${zmx_no_color} $line"; done ) \
    1> >( while read line; do echo -e "${zmx_gray} [${v1} ${v2}] ${zmx_no_color} $line"; done )
}

if [ "$first_arg" == "major" ] || [ "$first_arg" == "minor" ]; then
    if ! tsproject_match_arg "--decree" "${my_args[@]}"; then
        echo "You must use the --decree argument to ensure this command is what you really want to do.";
        exit 1;
    fi
fi

if ! tsproject_run_checks "${my_args[@]}"; then
   echo "A validation routine failed. Please check your system.";
   exit 1;
fi

#### consider running tests before you publish, something like this:
# rm -rf node_modules
# npm install --production --loglevel=warn
# tsc
# npm test

zmx npm version "$first_arg" || {
   echo -e "${zmx_magenta} => npm version command failed.${zmx_no_color}";
   exit 1;
}

zmx git push --follow-tags || {
    echo -e "${zmx_magenta} => git push command failed.${zmx_no_color}";
    exit 1;
}

if tsproject_match_arg "--no-publish" "${my_args[@]}"; then
    echo -e "${zmx_cyan} => The --no-publish flag was passed so nothing was published to NPM.${zmx_no_color}";
else
    zmx npm publish && {
      echo -e "${zmx_green} => A new version of your package.json was published successfully.${zmx_no_color}";
    }
fi

