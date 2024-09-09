#!/bin/bash
GIT_COMMIT=$(git rev-parse --short HEAD)

# Specify the files you want to lint
LINT_UNIT_TEST="/home/linter/test/mmw/mmw.bats"
LINT_BIN="/usr/local/bin/mmw"

# Run the container and automatically run shellcheck on both scripts
docker run --rm \
  -v "$HOME/Xuuki/src/mmw/test/mmw/":/home/linter/test/mmw/ \
  -v "$HOME/Xuuki/src/mmw/bin/":/usr/local/bin/ \
  mmw-linter:"$GIT_COMMIT" \
  "$LINT_UNIT_TEST" "$LINT_BIN"

