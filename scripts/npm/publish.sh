#!/usr/bin/env bash


set -e;

npm install --no-optional
tsc
npm test
r2g
npm version patch
./scripts/git/push.sh
npm publish
