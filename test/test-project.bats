source ./test/tmp/config
#!/usr/bin/env bats

@test "can set the Project name" {
  mmw setProj Test_Sheet
  projName=$(grep "^PROJ=Test_Sheet$" "./test/tmp/config")
  [ "$projName" = "PROJ=Test_Sheet" ]
}

@test "can set the Project Location" {
  mmw setProjLoc mmw/test
  projLocation=$(grep "^PROJLOC=mmw/test$" "./test/tmp/config")
  [ "$projLocation" = "PROJLOC=mmw/test" ]
}

# Read the line from the config file

    # Assert that the line is exactly as expected

@test "createScoreDesign should create the project score file" {

  [ -f "$LILY" ]
  mmw createLyScoreAndMidiFile
  [ -f "$MIDI" ]
  [ -f "$PDF" ]


  #Validate data
  #[ "$(cat "$HOME/projects_/flock/src/$PROJ.ly)" = "$projOrc" ]

}

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
