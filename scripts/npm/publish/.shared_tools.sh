#!/usr/bin/env bash


export ts_bold="$(tput bold)"
export ts_normal="$(tput sgr0)"

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
        echo "Current branch is not master => instead we have: '$branch'";
        return 1;
    fi
  fi


}

export zmx_gray='\033[1;30m'
export zmx_magenta='\033[1;35m'
export zmx_cyan='\033[1;36m'
export zmx_orange='\033[1;33m'
export zmx_yellow='\033[1;33m'
export zmx_green='\033[1;32m'
export zmx_no_color='\033[0m'

zmx(){
    local v1="$1"; local v2="$2";
    "$@"  \
    2> >( while read line; do echo -e "${zmx_magenta} [${v1} ${v2}] ${zmx_no_color} $line"; done ) \
    1> >( while read line; do echo -e "${zmx_gray} [${v1} ${v2}] ${zmx_no_color} $line"; done )
}


export -f zmx;
export -f tsproject_run_checks;
export -f tsproject_match_arg;
