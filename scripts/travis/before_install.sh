#!/usr/bin/env bash

echo "this is the travis 'before install'."

npm install -g typescript@2.8.3
npm install -g --loglevel=warn "@oresoftware/r2g"

