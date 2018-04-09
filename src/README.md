
If you are compiling from `src` to `dist`, put your files in here, and use this in `tsconfig.json`:

```js
{
  "compilerOptions": {
    "outDir": "dist",            // transpile *.ts files in the src dir to the dist dir
    "declaration": true,
    "baseUrl": ".",
    "target": "es6",
    "module": "commonjs",
    "noImplicitAny": true,
    "removeComments": true,
    "allowUnreachableCode": true,
    "lib": [
      "es2015",
      "es2016",
      "es2017"
    ]
  },
  "compileOnSave": false,
  "exclude": [
    "test",
    "node_modules"
  ],
  "include": [
    "src"                         // use src instead of lib
  ]
}
```

