source ./test/tmp/config
#!/usr/bin/env bats

@test "Test for wav file" {
  result=$(ip.sh getAudioInfo $HOME/audio/test.wav)
  expected=*"format_name=wav"*
  [[ $result == $expected ]]
}
