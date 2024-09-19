#!/usr/bin/env bats
# https://usage.imagemagick.org/canvas/
@test "Test for wav file" {
  ffmpeg -f lavfi -i sine=frequency=1000:duration=1 -t 1 $HOME/test.wav
  result=$(ip.sh getAudioInfo $HOME/test.wav)
  expected=*"format_name=wav"*
  [[ $result == $expected ]]
  rm $HOME/test.wav
}

@test "Generate solid colour canvas: enter filename, width then height " {
  ip.sh canvasSolidColorKhaki $HOME/test.png 720 720
  [ -f "$HOME/test.png" ]
  rm $HOME/test.png
}

@test "Generate solid colour canvas (xc short hand) " {
  ip.sh canvasSolidColorwheatxc $HOME/test.png 720 720
  [ -f "$HOME/test.png" ]
  rm $HOME/test.png
}

@test "specify xc canvas image, size and colour as single input image " {
  ip.sh canvasxcSingleInput $HOME/test.png 700 700
  [ -f "$HOME/test.png" ]
  rm $HOME/test.png
}

@test "Generate noise image" {
  ip.sh generateNoiseImage $HOME/test.png
  [ -f "$HOME/test.png" ]
  mv $HOME/test.png $HOME/Xuuki/src/sites/public/output.png
}

@test "Input canvas, Change it colour" {
  ip.sh generateNoiseImage $HOME/test.png 720 720
  ip.sh changekhakiCanvasColourToTomato $HOME/test.png
  [ -f "$HOME/test.png" ]
  [ -f "$HOME/recoloured.png" ]
  rm $HOME/test.png
}

@test "Grab single pixel from existing image" {
  ip.sh grabPixelFromBuiltInRose $HOME/test.png
  [ -f "$HOME/test.png" ]
  rm $HOME/test.png
}

