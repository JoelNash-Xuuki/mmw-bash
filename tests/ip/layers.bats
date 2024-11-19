#!/usr/bin/env bats
# https://usage.imagemagick.org/layers/

@test "Append horizontally" {
  ip.sh appendImages $HOME/images/appended.gif
  [ -f $HOME/images/appended.gif ]
}
