#!/usr/bin/env bats
# https://usage.imagemagick.org/canvas/

setup() {
  ip.sh canvasSolidColorKhaki $HOME/images/stills/test.png 720 720
}

teardown() {
  rm $HOME/images/stills/test.png
}

@test "Generate solid colour canvas: enter filename, width then height " {
  [ -f "$HOME/images/stills/test.png" ]
}

@test "Generate solid colour canvas (xc short hand) " {
  ip.sh canvasSolidColorwheatxc $HOME/images/stills/test.png 720 720
  [ -f "$HOME/images/stills/test.png" ]
}

@test "specify xc canvas image, size and colour as single input image " {
  ip.sh canvasxcSingleInput $HOME/images/stills/test.png 700 700
  [ -f "$HOME/images/stills/test.png" ]
}

@test "Grab single pixel from existing image" {
  ip.sh grabPixelFromBuiltInRose $HOME/images/stills/test.png
  [ -f "$HOME/images/stills/test.png" ]
}

@test "Generate image built from sound file" {
   rm "$HOME/images/stills/test.png"
   ffmpeg -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=48000 -t 5 "$HOME/input.wav"
   ffmpeg -i "$HOME/input.wav" -lavfi showspectrumpic=s=512x512:mode=combined $HOME/images/stills/test.png 
   rm "$HOME/input.wav"
   [ -f "$HOME/images/stills/test.png" ]
}

