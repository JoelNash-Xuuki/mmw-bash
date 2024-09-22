#!/usr/bin/env bats
# https://usage.imagemagick.org/canvas/

@test "Can generate: noise" {
  ip.sh rawRandomNoise
  [ -f $HOME/images/random.png ]
}

@test "random flux" {
  ip.sh randomFlux
  [ -f $HOME/images/flux_30.png ]
}

@test "multi page image" {
  ip.sh multiPageImage
  [ -f $HOME/images/multi-page-image.gif ]
}

@test "electrical filaments" {
  ip.sh electricalFilaments
  [ -f $HOME/images/electrical-filaments.gif ]
}

@test "random ripples" {
  ip.sh randomRipples
  [ -f $HOME/Xuuki/src/sites/public/output.png ]
}
