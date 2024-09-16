#!/usr/bin/env bats

setup() {
  mmw-config create
}

teardown() {
  rm -r "$PROJPATH"
  rm "$HOME/.config/mmw.config"
}

@test "Can set: project" {
  mmw-config addProjNameDeclaration
  mmw setProj test-proj
  projName=$(grep "^PROJ=test-proj$" "$HOME/.config/mmw.config")
  [ "$projName" = "PROJ=test-proj" ]
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
  mmw-config addProjNameDeclaration
  # shellcheck source=/dev/null
  source "$HOME/.config/mmw.config"
  mmw setProj My_Test_MMW_project
  mmw-config addProjLocationDeclaration 
  mmw setProjLoc 
  mmw-config addProjFilePathDeclarationAndDefinition
  mmw-config addArtistDeclaration
  mmw setArtist test-artist
  if [ -d "$HOME"/audio/test-artist/My_Test_MMW_project/ ]; then
    rm -r "$HOME"/audio/test-artist/My_Test_MMW_project/
  fi
  echo "y" | mmw createProj
  [ -d "$(mmw displayProj)" ] # PROJPATH
  #[ -f $HOME/audio/test-artist/My_Test_MMW_project/stems/input_1.wav ]
  #[ -d "$(mmw displayProj)"/sound-design ]
  #[ -d "$(mmw displayProj)"/session ]
}


