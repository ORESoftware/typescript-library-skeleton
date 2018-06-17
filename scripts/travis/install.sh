#!/usr/bin/env bash


echo "this is the travis 'install'."

# install all dependencies
npm install --loglevel=warn

# transpile typescript files
tsc -p tsconfig.json
