setup() {
  mmw-config create
  mmw-config addProjNameDeclaration
  mmw setProj My-Test-MMW-Proj
  mmw setProjLoc Test-Projects
  mmw-config addProjFilePathDeclarationAndDefinition
  mmw-config addArtistDeclaration
  mmw setArtist Test-Artist
  mmw-config addTempoDeclaration
  mmw setTempo 100
  mmw-config addStartTimeDeclaration
  mmw setStartTime 0
  mmw-config addDurDeclaration
  mmw setDur 16
  mmw-config addScoreDeclarationAndDefinition
  echo "y" | mmw createProj
  source $HOME/.config/mmw.config
  mmw writeLilyFile
  mmw createScorePDFAndMIDIFiles
  mmw buildInstrSoundDesignFiles
  mmw prodScoreAudio
  mmw makeTrack
  mmw createSessionFile
  $PROJPATH/session/session.eca
}

teardown() {
  source $HOME/.config/mmw.config
  rm -r $PROJPATH
  rm $HOME/.config/mmw.config
}

@test "create sound design" {
  [ -f "$(mmw displayProj)"/sound-design/My-Test-MMW-Proj.orc ]
  [ -f "$(mmw displayProj)"/sound-design/My-Test-MMW-Proj.sco ]
  [ -f "$HOME"/My-Test-MMW-Proj/audio/stems/My-Test-MMW-Proj.wav ]
  [ -f "$HOME"/My-Test-MMW-Proj/audio/stems/vocal.wav ]
  [ -f "$HOME"/My-Test-MMW-Proj/audio/stems/synth.wav ]
  [ -f "$HOME"/My-Test-MMW-Proj/audio/stems/bass.wav ]
  [ -f "$HOME"/My-Test-MMW-Proj/audio/stems/snare.wav ]
  [ -f "$HOME"/My-Test-MMW-Proj/audio/stems/brush.wav ]
  [ -f "$HOME"/My-Test-MMW-Proj/audio/stems/hihat.wav ]
  [ -f "$HOME"/My-Test-MMW-Proj/audio/stems/kick.wav ]
  [ -f "$HOME"/My-Test-MMW-Proj/audio/stems/recorded/input.wav ]
  [ -f "$HOME"/My-Test-MMW-Proj/audio/mix/My-Test-MMW-Proj.wav ]
}

