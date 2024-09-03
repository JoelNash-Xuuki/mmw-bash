#!/bin/bash

set -x

docker run --rm -it \
  -v "$(pwd)"/test/mmw/:/home/user/test/mmw/ xuuki/mmw-runner \
  shellcheck /home/user/test/mmw/mmw.bats

#docker run --rm -it -v $HOME/mmw/test/mmw/:/home/user/mmw/test/mmw/ xuuki/mmw-runner
