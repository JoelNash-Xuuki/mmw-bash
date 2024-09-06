#!/bin/bash
GIT_COMMIT=$(git rev-parse --short HEAD)

# Specify the script you want to lint
SCRIPT_TO_LINT="/home/linter/test/mmw/mmw.bats"

# Run the container and automatically run shellcheck on the specified script
docker run --rm -v $HOME/mmw/test/mmw/:/home/linter/test/mmw/ \
                   mmw-linter:$GIT_COMMIT "$SCRIPT_TO_LINT"
