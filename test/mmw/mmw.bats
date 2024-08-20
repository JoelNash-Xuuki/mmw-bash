#!/usr/bin/env bats
setup() {
  mmw-config create
}

teardown() {
  source $HOME/.config/mmw.config
  rm -r $PROJPATH
  rm $HOME/.config/mmw.config
}

@test "Can set: project" {
  mmw-config addProjNameDeclaration
  projName=$(grep "^PROJ=$" "$HOME/.config/mmw.config")
  [ "$projName" = "PROJ=" ]
}

@test "artist" {
  mmw-config addArtistDeclaration
  mmw setArtist test-artist
  artistName=$(grep "^ARTIST=test-artist$" "$HOME/.config/mmw.config")
  [ "$artistName" = "ARTIST=test-artist" ]
}

@test "tempo" {
  mmw-config addTempoDeclaration
  mmw setTempo 84
  tempo=$(grep "^TEMPO=84$" "$HOME/.config/mmw.config")
  [ "$tempo" = "TEMPO=84" ]
}

@test "start time" {
  mmw-config addStartTimeDeclaration
  mmw setStartTime
}

@test "dur/length" {
  mmw-config addStartTimeDeclaration
  mmw setDur 8
  dur=$(grep "^DUR=8$" "$HOME/.config/mmw.config")
  length=$(grep "^LENGTH=8$" "$HOME/.config/mmw.config")
  [ "$dur" = "DUR=8" ]
  [ "$length" = "LENGTH=8" ]
}

@test "creates a new project" {
  source $HOME/.config/mmw.config
  mmw-config addProjNameDeclaration
  mmw setProj My_Test_MMW_project
  mmw-config addProjLocationDeclaration 
  mmw setProjLoc mmw
  mmw-config addProjFilePathDeclarationAndDefinition
  mmw-config addArtistDeclaration
  mmw setArtist test-artist
  echo "y" | mmw createProj
  [ -d "$(mmw displayProj)" ] # PROJPATH
  [ -f $HOME/audio/test-artist/My_Test_MMW_project/stems/input_1.wav ]
  [ -d  "$(mmw displayProj)/sound_design" ]
  [ -d $(mmw displayProj)/session ]
}

