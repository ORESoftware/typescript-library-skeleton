#!/usr/bin/env sh

# we use sh instead of bash, it's even more cross-platform

set -e;

if [ "$skip_postinstall" == "yes" ]; then
    echo "skipping postinstall routine.";
    exit 0;
fi

export FORCE_COLOR=1;
export skip_postinstall="yes";

mkdir -p "$HOME/.oresoftware/bin" || {
  echo "Could not create .oresoftware dir in user home.";
  exit 1;
}

(
  echo 'Installing run-tsc-if on your system.';
  curl  -H 'Cache-Control: no-cache' -s -S -o- https://raw.githubusercontent.com/oresoftware/run-tsc-if/master/install.sh | bash || {
     echo 'Could not install run-tsc-if on your system. That is a problem.';
     exit 1;
  }
) 2> /dev/null


if [[ "$(uname -s)" == "Darwin" ]]; then

   if [ ! -f "$HOME/.oresoftware/bin/realpath" ]; then
      (
        curl --silent -o- https://raw.githubusercontent.com/oresoftware/realpath/master/assets/install.sh | bash || {
           echo "Could not install realpath on your system.";
           exit 1;
        }
      )
   fi
fi
