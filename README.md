
## TSLS - TypeScript Library Skeleton

<br>
Travis build status:
[![Build Status](https://travis-ci.org/ORESoftware/typescript-library-skeleton.svg?branch=master)](https://travis-ci.org/ORESoftware/typescript-library-skeleton)

<br>
CircleCI build status:
[![CircleCI](https://circleci.com/gh/ORESoftware/typescript-library-skeleton/tree/master.svg?style=svg)](https://circleci.com/gh/ORESoftware/typescript-library-skeleton/tree/master)

<br>
# Your Project Readme Goes Here

This project is used by:
https://github.com/oresoftware/ts-project
You can use ts-project to do things more automatically.

To do things more manually, continue on.

Steps to making this project skeleton your own project base.

1. Clone this repo: <br>
    `git clone https://github.com/ORESoftware/typescript-library-skeleton.git YOUR-PROJECT-NAME`
2. Update package.json so that `name` property matches `YOUR-PROJECT-NAME`.
3. Update other package.json fields so that they are accurate.

To check to see if `YOUR-PROJECT-NAME` is available on NPM, uses this command at the command line:

`$ npm view YOUR-PROJECT-NAME`  # will give you a 404 if the name is available.


### This project skeleton uses:

* the correct semver initial value (npm init defaults to 1.0.0 which is just wrong).
* typescript 2.9.x
* nodejs version 10
* travis/circleci (for automated testing of your library)
* MIT license
* good simple default settings for .gitignore / .npmignore / .editorconfig / .gitattributes
* Transpiling from src to dist folders (by default; you can change it manually)


To transpile files in place, instead of tranpiling from `'src'` to `'dist'`:

<br>
update tsconfig.json  (remove the `outDir` line):

```json
"compilerOptions": {
    "outDir": "dist"
}
```

For small projects with just one .ts/.js file, you can just get rid of the src/lib folder, and put your index.ts
file in the root of the project. In that case, make sure to change the `main` property in package.json from 'lib/index.js' to
'index.js'. Same with the `typings/types` properties.
