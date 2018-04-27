#!/usr/bin/env bash

set -e;

# "cm" is the commit message; default message is "set"
cm="${1:-'empty commit message'}"

git add .
git add -A
git commit --allow-empty -am "pdev:$cm"
git push