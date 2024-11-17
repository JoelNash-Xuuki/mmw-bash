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
  mmw createRecSession 100
}

#teardown() {
#  source $HOME/.config/mmw.config
#  rm -r $PROJPATH
#  rm -r "$HOME"/audio/"$PROJ"
#  rm $HOME/.config/mmw.config
#}

@test "create rec session" {
  [ -f "$(mmw displayProj)"/session/rec.eca ]
}

