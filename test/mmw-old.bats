#!/usr/bin/env bats
setup() {
  mmw-config create
  source $HOME/.config/mmw.config
  mmw setProj test-proj
  mmw setProjLoc mmw/test
  mmw setArtist Vyvn
  echo "y" | mmw createProj
}

teardown() {
  source $HOME/.config/mmw.config
  rm -r "$PROJPATH"
  rm $HOME/.config/mmw.config
}

@test "Set the Project name" {
  projName=$(grep "^PROJ=test-proj$" \
                  "$HOME/.config/mmw.config")
  [ "$projName" = "PROJ=test-proj" ]
}

@test "set the Project Location" {
  projLocation=$(grep "^PROJLOC=mmw/test$" \
                      "$HOME/.config/mmw.config")
  [ "$projLocation" = "PROJLOC=mmw/test" ]
}



@test "define rec session" {
  source $HOME/.config/mmw.config
  mmw configRec 98 input_1 input_2 250 250
  input_1=input_1
  input_2=input_2
  # Generate the expected ecasound command
  ecasound_command="ecasound -n $PROJ -f:16,2,48000 \\"$'\n'
  ecasound_command+="  -a:instr -i $AUDIO$input_1$FILE -ea:250 \\"$'\n'
  ecasound_command+="  -a:2,3 -i jack,system,1,0 \\"$'\n'
  ecasound_command+="  -a:2 -o $AUDIO$input_2$FILE -ea:250 \\"$'\n'
  ecasound_command+="  -a:met -i:null -pn:metronome,98 -ea:1 \\"$'\n'
  ecasound_command+="  -a:instr,3,met -o jack,system"
  echo "$ecasound_command" > "$HOME/mmw/test/$PROJ/expected_rec.eca"

  result=$(diff $PROJPATH/session/rec.eca $HOME/mmw/test/$PROJ/expected_rec.eca)
  [ "$result" == "" ]
}

##@test "create session 1" {
##  mmw play
##  run diff $PROJPATH/session/1/session.eca $HOME/mmw/test/expected_session.eca
##  [ "$status" -eq 0 ]
##}
##

#@test "create recording session" {
#
#}

#@test "renderAudio should create a .orc, .sco and .wav file" {
#  run mmw renderAudio
#
#  run ls $HOME/projects_/flock/src/sound-design/$PROJ.orc
#  [ "$status" -eq 0 ]
#
#  run ls $HOME/projects_/flock/src/sound-design/$PROJ.sco
#  [ "$status" -eq 0 ]
#
#  run ls $HOME/audio/Vyvn/Flock/1/stems/$PROJ.wav
#  [ "$status" -eq 0 ]
#
#}

















































#@test "createLyScoreAndMidiFile should generate the MIDI file" {
#  run createLyScoreAndMidiFile
#
#  # Check if the file exists
#  [ -f "tmp/$PROJ.mid" ]
#  assert_success
#}

#@test "createScoreDesign should render score" {
#  run mmw createScoreDesign
#  [ "$status" -eq 0 ]
#  [ "$output" = "rendering score..." ]
#}



#@test "renderScore should create the necessary files" {
#  run createScoreDesign
#
#  # Check if the score file was created
#  [ -f "$HOME/projects_/flock/src/$PROJ.ly" ]
#  assert_success
#
#}

#@test "renderAudio should generate the correct orc file" {
#  run renderAudio
#
#  [ "$status" -eq 0 ]
#  [ -f "$HOME/projects_/flock/src/sound-design/$PROJ.orc" ]
#  [ "$(cat "$HOME/projects_/flock/src/sound-design/$PROJ.orc")" = "$projOrc" ]
#}

#@test "renderAudio should execute the given command" {
#  run renderAudio echo "Command executed"
#
#  [ "$status" -eq 0 ]
#  [ "${lines[0]}" = "Command executed" ]
#}
#
#@test "renderAudio should pass arguments to the given command" {
#  run renderAudio echo "Argument: $1" "Another argument: $2"
#
#  [ "$status" -eq 0 ]
#  [ "${lines[0]}" = "Argument: $1" ]
#  [ "${lines[1]}" = "Another argument: $2" ]
#}





#@test "load a project" {
#  output="$(mmw load)"
#  [ "$output" = "loading project..." ]
#  [ "$PROJ" = "test-project-1" ]
#  [ "$PROJPATH" = "$HOME/mmw/test/$PROJ" ]
#}

#@test "Sound design file must exist" {
#  
#
#}
#
#@test "can create a file for 1 track" {
#  buildTrackName="$(mmw buildTrack $PROJ-$SESSION-$TRACK1)"
#  [ "$buildTrackName" = "$PROJ-$SESSION-$TRACK1" ]
#}

######################################################################3

#```bash
##!/usr/bin/env bats
#
#load 'test_helper'
#
#
#
#@test "renderAudio should create the project sound design file" {
#  run renderAudio
#
#  # Check if the file exists
#  [ -f "$HOME/projects_/flock/src/sound-design/$PROJ.orc" ]
#  assert_success
#}

