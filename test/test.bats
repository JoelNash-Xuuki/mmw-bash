#First file for you MMW tests
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

@test "Is project available " {
  if [ ! -f /home/mmw/bin/test-mmw-proj ]; then
    echo "echo "Welcome to your MMW project session"
           " > /home/joel/mmw/bin/test-mmw-proj
          chmod +x /home/joel/mmw/bin/test-mmw-proj # make test-mmw-proj executable
  fi
  run ls -l /home/joel/mmw/bin/test-mmw-proj
  [ "$status" -eq 0 ]
  #[[ $(ls -l /home/joel/mmw/bin/test-mmw-proj | cut -c 2-10) == "-rwxr-xr-x" ]] # check if file is executable
}

@test "Can create Option template if its not available" {
  if [ ! -f /home/joel/mmw/tmp/options-template ]; then
    echo "PROJ="[PROJECTNAME]"
PROJPATH=$HOME/projects_/$PROJ
LILY=\$PROJPATH/src/\$PROJ.ly
MIX=\$PROJPATH/src/mix.csd
CSD=\$PROJPATH/src/\$PROJ.csd
WAV=\$HOME/audio/\$PROJ.wav
WAVMIX=\$HOME/audio/\$PROJ-a.wav
BPM=84
BEAT=\$(bc <<< \"scale=4; (60/\$BPM)\")
BAR=\$(bc <<< \"scale=4;\$BEAT*4\")
DUR=\$(bc <<< \"scale=4;\$BAR*1\")
LENGTH=\$(bc <<< \"scale=2;\$BAR*24\")" > /home/joel/mmw/tmp/options-template
  fi

  run ls /home/joel/mmw/tmp/options-template
  [ "$status" -eq 0 ]
}

@test "Can use the options template to create options with a set the proj name " {
  sed "s/\[PROJECTNAME\]/hi/g;" /home/joel/mmw/tmp/options-template > /home/joel/mmw/tmp/options
  [ "$(cat $HOME/mmw/tmp/options | grep 'PROJ=')" = "PROJ=hi" ]
}

@test "Can use option template to create a location name for mmw projects" {
  if [ ! -d $HOME/test-mmw-proj-location/ ]; then
    mkdir $HOME/test-mmw-proj-location
  fi
  
  sed "s/\[PROJECTLOCATION\]/test-mmw-proj-location/g;" /home/joel/mmw/tmp/options-template > /home/joel/mmw/tmp/options

  [ "$(cat /home/joel/mmw/tmp/options | grep 'PROJPATH=')" = "PROJPATH=/home/joel/test-mmw-proj-location" ]
}




#assert [ "$(cat /home/joel/mmw/tmp/options | grep 'PROJPATH=')" = "PROJPATH=/home/joel/projects_/" ]
#assert [ "$(cat /home/joel/mmw/tmp/options | grep 'LILY=')" = "LILY=$PROJPATH/src/$PROJ.ly" ]
#assert [ "$(cat /home/joel/mmw/tmp/options | grep 'MIX=')" = "MIX=$PROJPATH/src/mix.csd" ]
#assert [ "$(cat /home/joel/mmw/tmp/options | grep 'CSD=')" = "CSD=$PROJPATH/src/$PROJ.csd" ]
#assert [ "$(cat /home/joel/mmw/tmp/options | grep 'WAV=')" = "WAV=$HOME/audio/$PROJ.wav" ]
#assert [ "$(cat /home/joel/mmw/tmp/options | grep 'WAVMIX=')" = "WAVMIX=$HOME/audio/$PROJ-a.wav" ]
#assert [ "$(cat /home/joel/mmw/tmp/options | grep 'BPM=')" = "BPM=84" ]
#assert [ "$(cat /home/joel/mmw/tmp/options | grep 'BEAT=')" = "BEAT=$(bc <<< 'scale=4; (60/$BPM)')" ]         
#assert [ "$(cat /home/joel/mmw/tmp/options | grep 'BAR=')" = "BAR=$(bc <<< 'scale=4;$BEAT*4')" ]
#assert [ "$(cat /home/joel/mmw/tmp/options | grep 'DUR=')" = "DUR=$(bc <<< 'scale=4;$BAR*1')" ]               
#assert [ "$(cat /home/joel/mmw/tmp/options | grep 'LENGTH=')" = "LENGTH=$(bc <<< 'scale=2;$BAR*24')" ]


#run ./test/bats/bin/bats --tap test/test.bats to run tests

