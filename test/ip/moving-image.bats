#!/usr/bin/env bats

@test "Can generate: noise" {
  rm $HOME/Xuuki/src/sites/public/output.mp4 
  ip.sh createMP4 $HOME/Xuuki/src/sites/public/output.wav 4 $HOME/Xuuki/src/sites/public/output.mp4
  [ -f $HOME/Xuuki/src/sites/public/output.mp4 ]
}

