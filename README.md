

# Your Project Readme Goes Here


### This project skeleton uses:

* typescript 2.x
* nodejs version 9
* travis (for automated testing of your library)
* MIT license
* good simple default settings for .gitignore / .npmignore



To compile your *.ts files to a dist directory (keeps your source and target files separate),
<br>
simply add this to tsconfig.json:


```json
"compilerOptions": {
    "outDir": "dist"
}
```

and

```json
 "include": [
    "src"
  ]
```

For small libraries with a couple of files, I find that using a dist folder (target directory) is more trouble
than it's worth. For projects with just one .ts/.js file, you can just get rid of the lib folder, and put your index.ts
file in the root of the project. In that case, make sure to change the `main` property in package.json from 'lib/index.js' to
'index.js'. Same with the `typings/types` properties.