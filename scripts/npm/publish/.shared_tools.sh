#!/usr/bin/env bash


export ts_bold="$(tput bold)"
export ts_normal="$(tput sgr0)"

tsproject_match_arg(){
    # checks to see if the first arg, is among the remaining args
    # for example  ql_match_arg --json --json # yes
    first_item="$1"; shift;
    for var in "$@"; do
        if [[ "$var" == "$first_item" ]]; then
          echo "yes";
          return 0;
        fi
    done
}

export -f tsproject_match_arg;
