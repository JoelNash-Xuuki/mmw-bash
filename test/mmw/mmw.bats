#!/usr/bin/env bats
setup() {
  mmw-config create
  source $HOME/.config/mmw.config
  #$HOME/mmw/bin/mmw setProjLoc $HOME/mmw/test
  #$HOME/mmw/bin/mmw setArtist Vyvn
  #echo "y" | $HOME/mmw/bin/mmw createProj
}

teardown() {
#  rm -r "$PROJPATH"
  rm $HOME/.config/mmw.config
}

@test "Define: project name" {
  mmw-config addProjNameDeclaration
  mmw setProj test-proj
  projName=$(grep "^PROJ=test-proj$" \
                  "$HOME/.config/mmw.config")
  [ "$projName" = "PROJ=test-proj" ]
}

@test "project location" {
  mmw-config addProjLocationDeclaration
  mmw setProjLoc mmw/test
  projLocation=$(grep "^PROJLOC=mmw/test$" \
                      "$HOME/.config/mmw.config")
  [ "$projLocation" = "PROJLOC=mmw/test" ]
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

