setup() {
  mmw-config create
  mmw-config addProjNameDeclaration
  mmw setProj My-Test-MMW-Proj
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
  mmw writeLilyFile
  mmw createScorePDFAndMIDIFiles
  mmw buildInstrSoundDesignFiles
  mmw prodScoreAudio
  mmw makeTrack
  mmw createSessionFile
}

teardown() {
  source $HOME/.config/mmw.config
  rm -r $PROJPATH
  rm -r "$HOME"/audio/"$PROJ"
  rm $HOME/.config/mmw.config
}

@test "create sound design" {
  [ -f "$(mmw displayProj)"/sound-design/My-Test-MMW-Proj.orc ]
  [ -f "$(mmw displayProj)"/sound-design/My-Test-MMW-Proj.sco ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/My-Test-MMW-Proj.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/vocal.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/synth.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/bass.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/snare.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/brush.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/hihat.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/kick.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/My-Test-MMW-Proj.wav ]
}

