source ./test/tmp/config

@test "load a project" {
  output="$(mmw load)"
  [ "$output" = "loading project..." ]
  [ "$PROJ" = "test-project-1" ]
  [ "$PROJPATH" = "$HOME/mmw/test/$PROJ" ]
}

@test "Sound design file must exist" {

}

@test "can create a file for 1 track" {
  buildTrackName="$(mmw buildTrack $PROJ-$SESSION-$TRACK1)"
  [ "$buildTrackName" = "$PROJ-$SESSION-$TRACK1" ]
}
