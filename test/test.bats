@test "csound is installed" {
  command -v csound >/dev/null 2>&1 || {
    skip "csound is not installed"
  }
}

@test "csound realtime option available" {
  run csound --realtime /home/joel/mmw/test/src/test.csd
  [ "$status" -eq 0 ]
}

@test "csound dac option available" {
  run csound -odac /home/joel/mmw/test/src/test.csd
  [ "$status" -eq 0 ]
}

@test "csound buffer size set to 256 samples {
  run csound -b256  /home/joel/mmw/test/src/test.csd
  [ "$status" -eq 0 ]
}

@test "csound can run with Real-Time Audio engine using Jack audio connection kit" {
  run csound -+rtaudio=jack  /home/joel/mmw/test/src/test.csd
  [ "$status" -eq 0 ]
}



