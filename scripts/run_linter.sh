#!/bin/bash

# Specify the script you want to lint
SCRIPT_TO_LINT="/home/linter/test/mmw/mmw.bats"

# Run the container and automatically run shellcheck on the specified script
docker run --rm -v /home/jnash/mmw/test/mmw/:/home/linter/test/mmw/  mmw-linter "$SCRIPT_TO_LINT"
