#!/usr/bin/env bats

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

  [ -f "$HOME/test.png" ]
  rm $HOME/test.png
}

@test "Generate noise image" {
  ip.sh generate_noise_image $HOME/test.png 720 720
  [ -f "$HOME/test.png" ]
  rm $HOME/test.png
}

