#!/usr/bin/env bash


set -e;

rm -rf node_modules
npm install --no-optional
tsc
npm test
r2g
npm version patch
./scripts/git/push.sh
npm publish
