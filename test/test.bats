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

@test "csound has a group of options that can work together" {
    run csound --realtime -odac -iadc -B512 -b256  /home/joel/mmw/test/src/test.csd
    [ "$status" -eq 0 ]
}

@test "csound cmd to define mmw rec() with and without jack" {
    if pgrep jackd > /dev/null; then
      run csound --realtime -odac -iadc -B256 -b256 -+rtaudio=jack /home/joel/mmw/test/src/test.csd
    else
      run csound --realtime -odac -iadc -B256 -b256 /home/joel/mmw/test/src/test.csd
    fi
    [ "$status" -eq 0 ]
}


sed 's/\[RECTOAUDIOFILE\]/Susan/g; s/\[ADJECTIVE\]/hair/g; s/\[VERB\]/smile/g' template.txt > output.txt


/home/joel/audio/test-rec-1.wav




#run ./test/bats/bin/bats --tap test/test.bats to run tests

