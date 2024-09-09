#!/bin/bash
GIT_COMMIT=$(git rev-parse --short HEAD)

# Run the container and automatically run shellcheck on the specified script

docker run --rm -v $HOME/mmw/test/mmw/:/home/linter/test/mmw/ \
                   -it mmw-unit-tester:$GIT_COMMIT
#docker run --rm -it mmw-unit-tester
