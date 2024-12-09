#!/usr/bin/env bats
setup() {
  mmw-config create
  mmw-config addProjNameDeclaration
  mmw setProj My-Test-MMW-Proj
  mmw-config addProjFilePathDeclarationAndDefinition
  mmw-config addArtistDeclaration
  mmw setArtist Test-Artist
  mmw-config addTempoDeclaration
  mmw setTempo 84
  mmw-config addStartTimeDeclaration
  mmw setStartTime 0
  mmw-config addScoreDeclarationAndDefinition
  echo "y" | mmw createProj
  mmw writeLilyFile
  mmw createScorePDFAndMIDIFiles
}

teardown() {
  source $HOME/.config/mmw.config
  rm -r $PROJPATH
  rm $HOME/.config/mmw.config
}

@test "creates a new project with score design (lilypond file)" {
  [ -d "$(mmw displayProj)" ] 
  [ -f $HOME/audio/Test-Artist/My-Test-MMW-Proj/stems/input.wav ]
  [ -f "$HOME/My-Test-MMW-Proj/My-Test-MMW-Proj.ly" ]
}
@test "create sheet music as PDF and Midi file" {
  [ -f "$HOME/Documents/My-Test-MMW-Proj.pdf" ]
  [ -f "$HOME/Documents/My-Test-MMW-Proj.mid" ]
}

