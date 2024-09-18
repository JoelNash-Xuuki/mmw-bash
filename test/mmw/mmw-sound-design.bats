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
  mmw-config addDurDeclaration
  mmw setDur 8
  echo "y" | mmw createProj
  mmw buildInstrSoundDesignFiles
  mmw prodScoreAudio
  mmw makeTrack
  # mmw createSessionFile
}

teardown() {
  source $HOME/.config/mmw.config
  rm -r $PROJPATH
  rm $HOME/.config/mmw.config
}

@test "create sound design" {
  [ -f "$(mmw displayProj)"/sound-design/My-Test-MMW-Proj.orc ]
  [ -f "$(mmw displayProj)"/sound-design/My-Test-MMW-Proj.sco ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/My-Test-MMW-Proj.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/synth.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/drums.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/bass.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/guitar.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/hihat.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/snare.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/kick.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/piano.wav ]
  [ -f "$HOME"/audio/Test-Artist/My-Test-MMW-Proj/stems/vocal.wav ]
}

#@test "play sound design" {
#  [ -f "$HOME/audio/Test-Artist/My-Test-MMW-Proj/My-Test-MMW-Proj.wav" ]
#  mv "$HOME/audio/Test-Artist/My-Test-MMW-Proj/My_Test_MMW_Proj.wav" $HOME/Xuuki/src/sites/public/metronome.wav
#}
#
