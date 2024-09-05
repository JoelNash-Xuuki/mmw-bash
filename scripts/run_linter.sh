#!/bin/bash

# Specify the script you want to lint
SCRIPT_TO_LINT="/home/linter/test-shellcheck-mount-container/script-from-host.sh"

# Run the container and automatically run shellcheck on the specified script
docker run --rm -v /home/jnash/mmw/test-shellcheck-mount-host:/home/linter/test-shellcheck-mount-container mmw-linter "$SCRIPT_TO_LINT"

