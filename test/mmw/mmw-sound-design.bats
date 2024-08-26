setup() {
  mmw-config create
}

teardown() {
  source $HOME/.config/mmw.config
  rm -r $PROJPATH
  rm $HOME/.config/mmw.config
}

@test "create sound design" {
  mmw-config addProjNameDeclaration
  mmw setProj My_Test_MMW_project
  mmw-config addProjLocationDeclaration 
  mmw setProjLoc mmw
  mmw-config addProjFilePathDeclarationAndDefinition
  mmw-config addArtistDeclaration
  mmw setArtist test-artist
  mmw-config addScoreDeclarationAndDefinition
  if [ -d $HOME/audio/test-artist/My_Test_MMW_project/ ]; then 
    rm -r $HOME/audio/test-artist/My_Test_MMW_project/
  fi
  echo "y" | mmw createProj
  [ "$HOME/mmw/My_Test_MMW_project.ly" = "$(mmw getScore)" ]
  mmw writeLilyFile
  mmw createScorePDFAndMIDIFiles
  [ -f "$HOME/Documents/My_Test_MMW_project.pdf" ]
  [ -f "/tmp/My_Test_MMW_project.mid" ]

  mmw buildInstrSoundDesignFiles
  [ -f $HOME/mmw/My_Test_MMW_project/sound_design/My_Test_MMW_project.orc ]
  [ -f $HOME/mmw/My_Test_MMW_project/sound_design/My_Test_MMW_project.sco ]
}

