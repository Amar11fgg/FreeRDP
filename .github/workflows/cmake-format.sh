name: cmake-format
on:
  workflow_dispatch:
    branches: [ master, stable* ]
  pull_request:
    branches: [ master, stable* ]
  schedule:
    - cron: '30 4 * * SUN'

jobs:
  build:
    runs-on: ubuntu-latest
    name: "cmake-format"
    steps:
      - name: "Check out source"
        uses: actions/checkout@v4

      - name: "Prepare environment"
        run: |
          sudo apt-get update -q -y
          sudo apt-get install -q -y \
            cmake-format

      - name: "Run shfmt..."
        run: |
          ./scripts/cmake-format.sh
