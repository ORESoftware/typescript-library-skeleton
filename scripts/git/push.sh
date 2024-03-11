#!/usr/bin/env bash

set -e;

# "cm" is the commit message; default message is "set"
cm="${1:-'set'}"

git add .
git add -A
git commit -am "pdev:$cm"
git push
