#!/usr/bin/env sh

# note: we must use sh instead of bash, it's more cross-platform
# for example in Alpine linux images/containers, etc

set -e;

if [ "$skip_postinstall" = "yes" ]; then   # TODO rename 'skip_postinstall' to something more specific
    echo "skipping postinstall routine.";
    exit 0;
fi

export FORCE_COLOR=1;
export skip_postinstall="yes";   # TODO rename 'skip_postinstall' to something more specific

mkdir -p "$HOME/.oresoftware/bin" || {
  echo "Could not create .oresoftware dir in user home.";
  exit 1;
}

(
  echo 'Installing run-tsc-if on your system.';
  curl  -H 'Cache-Control: no-cache' -s -S -o- 'https://raw.githubusercontent.com/oresoftware/run-tsc-if/master/install.sh' | bash || {
     echo 'Could not install run-tsc-if on your system. That is a problem.';
     exit 1;
  }
) 2> /dev/null


if [ "$(uname -s)" != "Darwin" ]; then
   exit 0;
fi

if [ ! -f "$HOME/.oresoftware/bin/realpath" ]; then
  (
    curl --silent -o- 'https://raw.githubusercontent.com/oresoftware/realpath/master/assets/install.sh' | bash || {
       echo "Could not install realpath on your system.";
       exit 1;
    }
  )
fi

# the end of the postinstall script


