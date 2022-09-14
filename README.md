# dataset-iac-demo
Repository for dataset IaC Demo
```
name: IAC checks
on:
  push:
    branches:
      - master

jobs:
  tflint:
    runs-on: ubuntu-latest

    steps:
      - name: Check out
        uses: actions/checkout@v3

      - name: Setup TFLinter
        uses: terraform-linters/setup-tflint@v2

      - name: Init
        run: tflint --init

      - name: Show version
        run: tflint --version

      - name: Check terraform scripts
        shell: bash
        run: tflint | sed "s/^\(.*\)/${GITHUB_REPOSITORY#*/}:\1/" > tflint.log

      - name: Send report to dataset output
        shell: bash
        env:
          DATASET_API_KEY: ${{ secrets.DATASET_API_KEY }}
        run: |
          curl -H "Content-Type: text/plain" \
          -H "Authorization: Bearer $DATASET_API_KEY" \
          --data-binary @tflint.log \
          -X POST "https://app.scalyr.com/api/uploadLogs?parser=tflint_compact&logfile=tflint.log&host=github"
```
