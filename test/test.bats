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



#@test "Test rec function with .csd file" {
#  mmw rec "test/src/test.csd"                                                                                            
#  [ "$status" -eq 0 ]
#}

# csound  --realtime -odac -iadc -B512 -b256 -+rtaudio=jack /home/joel/mmw/src/rec.csd



#"-iadc -B512 -b256 -+rtaudio=jack /home/joel/mmw/src/rec.csd"


