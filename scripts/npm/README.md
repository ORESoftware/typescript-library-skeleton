

### Don't use np from sindresorhus

Here we have bash solutions for publishing to NPM and creating matching
git tags, and pushing the corresponding tag to your git remote.

You can alter these bash scripts as you please, on a per project basis,
which is the right way to about it.


### Example

To publish a new patched version, run:

```bash
./scripts/npm/publish.sh patch
```

To publish a new minor version, run:

```bash
./scripts/npm/publish.sh minor
```

To publish minor/major versions, you need to pass the --decree option at the command line. <br>
This will help you prevent bad mistakes, like bumping a minor/major version by accident.
