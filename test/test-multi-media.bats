source ./test/tmp/config
#!/usr/bin/env bats

@test "Test for wav file" {
  ffmpeg -f lavfi -i sine=frequency=1000:duration=1 -t 1 $HOME/test.wav
  result=$(ip.sh getAudioInfo $HOME/test.wav)
  expected=*"format_name=wav"*
  [[ $result == $expected ]]
  rm $HOME/test.wav
}

@test "Generate Image" {
  ip generate_noise_image $HOME/test.png
  [ -f "$HOME/test.png" ]
  rm $HOME/test.png
}

