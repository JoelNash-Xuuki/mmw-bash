setup() {
  mmw-config create
  # shellcheck source=/dev/null
  source "$HOME"/.config/mmw.config
}

@test "session exits" {
  # shellcheck source=/dev/null
  source "$HOME"/.config/mmw.config
  mmw-config addProjNameDeclaration
  mmw setProj My_Test_MMW_project
  mmw-config addProjLocationDeclaration 
  mmw setProjLoc mmw
  mmw-config addProjFilePathDeclarationAndDefinition
  mmw-config addArtistDeclaration
  mmw setArtist test-artist
  mmw-config addScoreDeclarationAndDefinition
  if [ -d "$HOME/audio/test-artist/My_Test_MMW_project/" ]; then 
    rm -r "$HOME/audio/test-artist/My_Test_MMW_project/"
  fi
  echo "y" | mmw createProj
  [ -f "$PROJPATH/My_Test_MMW_project.ly" ]
  mmw writeLilyFile
  mmw createScorePDFAndMIDIFiles
  [ -f "$HOME/Documents/My_Test_MMW_project.pdf" ]
  #[ -f "$PROJPATH/My_Test_MMW_project.mid" ]

  mmw buildInstrSoundDesignFiles
  #[ -f $PROJPATH/sound-design/My_Test_MMW_project.orc ]
  #[ -f $PROJPATH/sound-design/My_Test_MMW_project.sco ]

  mmw prodScoreAudio
  [ -f "$HOME/audio/test-artist/My_Test_MMW_project/stems/My_Test_MMW_project.wav" ]

  mmw makeTrack
  [ -f "$HOME/audio/test-artist/My_Test_MMW_project/stems/synth.wav" ]
  [ -f "$HOME/audio/test-artist/My_Test_MMW_project/stems/drums.wav" ]
  [ -f "$HOME/audio/test-artist/My_Test_MMW_project/stems/bass.wav" ]
  [ -f "$HOME/audio/test-artist/My_Test_MMW_project/stems/guitar.wav" ]
  [ -f "$HOME/audio/test-artist/My_Test_MMW_project/stems/hihat.wav" ]
  [ -f "$HOME/audio/test-artist/My_Test_MMW_project/stems/snare.wav" ]
  [ -f "$HOME/audio/test-artist/My_Test_MMW_project/stems/kick.wav" ]
  [ -f "$HOME/audio/test-artist/My_Test_MMW_project/stems/piano.wav" ]
  [ -f "$HOME/audio/test-artist/My_Test_MMW_project/stems/vocal.wav" ]


  # ensure sound server is active 

 [ -f "$PROJPATH/session/session.eca" ] 
  mmw sendSessionToStdout
  #[ -f "$HOME/audio/test-artist/My_Test_MMW_project/My_Test_MMW_project.wav" ]
}
