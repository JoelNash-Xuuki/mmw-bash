#!/bin/bash
# Run the container and automatically run shellcheck on the specified script

docker run --rm -v /home/jnash/mmw/test/mmw:/home/mmw-user/test/mmw -it mmw-unit-tester
#docker run --rm -it mmw-unit-tester
