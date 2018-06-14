
By default, you are compiling from `src` to `dist`, and the source files go in here.

However, if you wish to compile target files in the same directory, then do the following:

Update `tsconfig.json`:

```js
{
  "compilerOptions": {
    "outDir": "dist",     // remove this line
  }
}
```

In that case, you may want to call your folder lib instead src, <br>
because "src" has the connation that the target files will be  <br>
transpiled to a different location.
