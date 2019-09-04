#!/usr/bin/env bash

### we use this bash file instead of a dist/.js file, because of this problem:
### https://stackoverflow.com/questions/50616253/how-to-resolve-chicken-egg-situation-with-tsc-and-npm-install

dir_name="$(dirname "$0")"
read_link="$(readlink "$0")";
exec_dir="$(dirname $(dirname "$read_link"))";
my_path="$dir_name/$exec_dir";
basic_path="$(cd $(dirname ${my_path}) && pwd)/$(basename ${my_path})"
js="$basic_path/dist/cli.js"


project_root="$(pwd)"

if [[ ! -f "$HOME/.oresoftware/bin/run-tsc-if"  ]]; then
  curl --silent -o- https://raw.githubusercontent.com/oresoftware/run-tsc-if/master/install.sh | bash || {
   echo "Could not install run-tsc-if on your system.";
   exit 1;
  }
fi

"$HOME/.oresoftware/bin/run-tsc-if" "$project_root"

### there is an extradinary amount of magic required to get a bash script
### to properly reference an adjacent .js file
### if the above can be simplified, please lmk, but the above is currently very necessary.

### one value add here of using a bash script, is that we can easily install any missing CLI dependencies
### or set env variables as needed

### run this mofo
node "$js" "$@"
