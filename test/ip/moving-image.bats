#!/usr/bin/env bats
setup() {
  if [ -f $HOME/Xuuki/src/sites/public/output.mp4 ]; then
    rm $HOME/Xuuki/src/sites/public/output.mp4
  fi 
  ip.sh createMP4 $HOME/Xuuki/src/sites/public/output.wav 6 $HOME/Xuuki/src/sites/public/output.mp4
}

@test "Can generate: mp4" {
  [ -f $HOME/Xuuki/src/sites/public/output.mp4 ]
}

@test "scale mp4 to 1920x1080" {
  ip.sh scaleMP4 $HOME/Xuuki/src/sites/public/output.mp4 $HOME/Xuuki/src/sites/public/output-temp.mp4
  mv $HOME/Xuuki/src/sites/public/output-temp.mp4 $HOME/Xuuki/src/sites/public/output.mp4
  [ -f $HOME/Xuuki/src/sites/public/output.mp4 ]
}

@test "rotate mp4 90 degrees" {
  ip.sh rotateMP4 $HOME/Xuuki/src/sites/public/output.mp4 $HOME/Xuuki/src/sites/public/output-temp.mp4
  mv $HOME/Xuuki/src/sites/public/output-temp.mp4 $HOME/Xuuki/src/sites/public/output.mp4
  [ -f $HOME/Xuuki/src/sites/public/output.mp4 ]
}

@test "overlay" { 
  ip.sh scaleMP4 $HOME/Xuuki/src/sites/public/output.mp4 $HOME/Xuuki/src/sites/public/output-temp.mp4
  mv $HOME/Xuuki/src/sites/public/output-temp.mp4 $HOME/Xuuki/src/sites/public/output.mp4

  ip.sh rotateMP4 $HOME/Xuuki/src/sites/public/output.mp4 $HOME/Xuuki/src/sites/public/output-temp.mp4
  mv $HOME/Xuuki/src/sites/public/output-temp.mp4 $HOME/Xuuki/src/sites/public/output.mp4

  ip.sh overlayImage $HOME/Xuuki/src/sites/public/output.mp4 $HOME/Xuuki/src/sites/public/output.gif 0 4 $HOME/Xuuki/src/sites/public/output-temp.mp4 
  [ -f $HOME/Xuuki/src/sites/public/output.mp4 ]
}

