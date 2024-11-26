#!/usr/bin/env bats

AUDIO=$HOME/audio/Test-Artist/My-Test-MMW-Proj/mix/My-Test-MMW-Proj.wav 
OUTPUT=$HOME/images/movies/output.mp4

setup_file() {
  ip.sh createMP4 $AUDIO 6 $OUTPUT 360 360 
  #ip.sh scaleMP4 $OUTPUT $OUTPUT-Scaled.mp4
  #ip.sh rotateMP4 $OUTPUT $OUTPUT-Rotate.mp4
}

# teardown_file() {
#  rm $OUTPUT
#  #rm $OUTPUT-Scaled.mp4
# }

@test "Can generate: mp4" {
  [ -f $OUTPUT ]
}

@test "Overlay media in different orders" {
  ip.sh overlayMedia $HOME/images/appended.gif $OUTPUT $HOME/images/movies/output-overlay.mp4 #"10:10" "360:360" ":enable='between(t,0,10)'"
  [ -f $HOME/images/movies/output.mp4 ]
}
 
#@test "scale mp4 to 1920x1080" {
#  [ -f $OUTPUT-Scaled.mp4 ]
#}
# 
#@test "rotate mp4 90 degrees" {
#  [ -f $OUTPUT-Rotate.mp4 ]
#}

# @test "overlay" { 
#   ip.sh scaleMP4 $OUTPUT $HOME/output-temp.mp4
#   mv $HOME/output-temp.mp4 $OUTPUT
# 
#   ip.sh rotateMP4 $OUTPUT $HOME/output-temp.mp4
#   mv $HOME/output-temp.mp4 $OUTPUT 
# 
#   [ -f $HOME/images/multi-page-image.gif ]
#   ip.sh overlayImage $OUTPUT $HOME/images/electrical-filaments.gif 0 6 $HOME/output-temp.mp4 
# }
# 


