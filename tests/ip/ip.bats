#!/usr/bin/env bats
# https://usage.imagemagick.org/canvas/

setup() {
  ip.sh canvasSolidColorKhaki $HOME/test.png 720 720
}

teardown() {
  rm $HOME/test.png
}

@test "Generate solid colour canvas: enter filename, width then height " {
  [ -f "$HOME/test.png" ]
}

@test "Generate solid colour canvas (xc short hand) " {
  ip.sh canvasSolidColorwheatxc $HOME/test.png 720 720
  [ -f "$HOME/test.png" ]
}

@test "specify xc canvas image, size and colour as single input image " {
  ip.sh canvasxcSingleInput $HOME/test.png 700 700
  [ -f "$HOME/test.png" ]
}

@test "Grab single pixel from existing image" {
  ip.sh grabPixelFromBuiltInRose $HOME/test.png
  [ -f "$HOME/test.png" ]
}

@test "Generate image built from sound file" {
   rm $HOME/images/stills/test.png
   ffmpeg -i $HOME/audio/Test-Artist/My-Test-MMW-Proj/My-Test-MMW-Proj.wav -lavfi showspectrumpic=s=512x512:mode=combined $HOME/images/stills/test.png
}

