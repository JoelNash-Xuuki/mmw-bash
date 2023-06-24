@test "Check rec source file in place or create it" {
  if [ ! -f /home/joel/mmw/test/src/test.csd ]; then
    echo "<CsoundSynthesizer>
          <CsOptions>
            -W -d ;-o /home/joel/mmw/tmp/tone.wav
          </CsOptions>
          ;-W: Enables warnings. Csound will display warning messages 
	  ;during the rendering process if there are any issues or potential 
	  ;problems in the Csound code.
          ;-d: Enables debug mode. Csound will display debug information 
          ;during the rendering process, which can be useful for 
          ;troubleshooting and understanding the internal workings of Csound.
          ;-o tone.wav: Specifies the output file name as "tone.wav". 
          ;This flag determines the name and format of the rendered 
          ;audio file. In this case, the rendered audio will be 
	  ;saved as a WAV file with the name "tone.wav".
          
          <CsVersion>    ; optional section
            After 6.10
          </CsVersion>
          
          <CsInstruments>
            ; originally tone.orc
            sr = 44100
            kr = 4410
            nchnls = 1
            instr   1
                a1 oscil p4, p5, 1 ; simple oscillator
                   out a1
            endin
          </CsInstruments>
          
          <CsScore>
            ; originally tone.sco
            f1 0 8192 10 1
            i1 0 1 20000 1000 ; play one second of one kHz tone
            e
          </CsScore>
          
          </CsoundSynthesizer>" > /home/joel/mmw/test/src/test.csd
  fi
  run ls /home/joel/mmw/test/src/test.csd
    [ "$status" -eq 0 ]
}

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

@test "target audio file to record to " {
    template_file="/home/joel/mmw/test/src/test-rec-template.csd"
    output_file="/home/joel/mmw/test/src/test-rec.csd"
    filepath="/home/joel/mmw/tmp/test-rec-1.wav"
    
    run sed "s/\[RECTOAUDIOFILE\]/$filePath/g; s/\[ADJECTIVE\]/hair/g; s/\[VERB\]/smile/g" "$template_file" > "$output_file"
    [ "$status" -eq 0 ]
}

#filePath="/home/joel/mmw/tmp/test-rec-1.wav"
#sed "s/\[RECTOAUDIOFILE\]/$filePath/g; s/\[ADJECTIVE\]/hair/g; s/\[VERB\]/smile/g" test-rec-template.csd > test-rec.csd












#run ./test/bats/bin/bats --tap test/test.bats to run tests

