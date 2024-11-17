#!/usr/bin/env bats

AUDIO=$HOME/audio/Test-Artist/My-Test-MMW-Proj/My-Test-MMW-Proj.wav 
OUTPUT=/data/video/output.mp4

setup() {
  if [ -f $OUTPUT ]; then
     sudo rm $OUTPUT 
  fi 
  sudo ip.sh createMP4 $AUDIO 6 $OUTPUT 
}

@test "Can generate: mp4" {
  [ -f $OUTPUT ]
}

@test "scale mp4 to 1920x1080" {
  sudo ip.sh scaleMP4 $OUTPUT $HOME/output-temp.mp4
  sudo mv $HOME/output-temp.mp4 $OUTPUT
  [ -f $OUTPUT ]
}

@test "rotate mp4 90 degrees" {
  sudo ip.sh rotateMP4 $OUTPUT $HOME/output-temp.mp4
  sudo mv $HOME/output-temp.mp4 $OUTPUT 
  [ -f $OUTPUT ]
}
 
 @test "overlay" { 
   sudo ip.sh scaleMP4 $OUTPUT $HOME/output-temp.mp4
   sudo mv $HOME/output-temp.mp4 $OUTPUT
 
   sudo ip.sh rotateMP4 $OUTPUT $HOME/output-temp.mp4
   sudo mv $HOME/output-temp.mp4 $OUTPUT 
 
   ip.sh overlayImage $HOME/Xuuki/src/sites/public/output.mp4 $HOME/Xuuki/src/sites/public/output.gif 0 6 $HOME/Xuuki/src/sites/public/output-temp.mp4 
   [ -f $HOME/Xuuki/src/sites/public/output.mp4 ]
 }
 
