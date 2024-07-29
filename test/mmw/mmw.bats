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

@test "Can set: project location" {
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

