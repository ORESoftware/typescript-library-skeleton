#!/usr/bin/env bash


cmd="npm install $@";
echo "$cmd" | bash;

if [ "$?" != "0" ]; then
  echo "Could not run the following npm install command: $cmd";
  exit 1;
fi

if ! command -v nlu &> /dev/null; then
   npm i -g -s 'npm-link-up' || {
     echo "Could not install npm-link-up";
     echo "Check your permissions to install global NPM packages.";
     exit 1;
   }
fi

echo "Now running npm-link-up...";
nlu run --shell-version --install-main;
