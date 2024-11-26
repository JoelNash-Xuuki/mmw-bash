#!/usr/bin/env bats
# https://usage.imagemagick.org/layers/

@test "Append horizontally" {
  ip.sh appendImages3x3 $HOME/images/appended.gif $HOME/images/flux_0.png $HOME/images/text-to-image.png
  [ -f $HOME/images/appended.gif ]
}
