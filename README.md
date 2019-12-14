# setup-graalvm-ce

This is a GitHub Action for setting up GraalVM CE of specified version.

## Inputs

### `graalvm-version`

GraalVM version (required)

Default: 19.3.0

### `java-version`

Java version (required)

Default: java8

## Examples

```yaml
on: push
jobs:
  setup-graalvm-ce:
    runs-on: ubuntu-latest
    steps:
      - name: setup-graalvm-ce
        uses: rinx/setup-graalvm-ce@v0.0.2
        with:
          graalvm-version: "19.3.0"
          java-version: "java11"
      - name: setup-native-image
        run: |
          gu install native-image
```
