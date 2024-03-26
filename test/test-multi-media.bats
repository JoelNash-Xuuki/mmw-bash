source ./test/tmp/config
#!/usr/bin/env bats

@test "Test for wav file" {
  result=$(ip.sh getAudioInfo)
  expected=*"format_name=wav"*
  [[ $result == $expected ]]
}
