setup() {
  mmw-config create
}

teardown() {
  source $HOME/.config/mmw.config
  rm -r $PROJPATH
  rm $HOME/.config/mmw.config
}

@test "creates a new project with score" {
  source $HOME/.config/mmw.config
  mmw-config addProjNameDeclaration
  mmw setProj My_Test_MMW_project
  mmw-config addProjLocationDeclaration 
  mmw setProjLoc mmw
  mmw-config addProjFilePathDeclarationAndDefinition
  mmw-config addArtistDeclaration
  mmw setArtist test-artist

  echo "y" | mmw createProj
  [ -d "$(mmw displayProj)" ] # PROJPATH
  [ -f $HOME/audio/test-artist/My_Test_MMW_project/stems/input_1.wav ]            
  [ -d  $(mmw displayProj)/sound_design ]
  [ -d $(mmw displayProj)/session ]
}

@test "createScoreDesign should create the project score file" {
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
  [ -f "$(mmw getScore)" ]

  #[ -f "$MIDI" ]
  #[ -f "$PDF" ]

  #Validate data
  #[ "$(cat "$HOME/projects_/flock/src/$PROJ.ly)" = "$projOrc" ]
}

@test "create sheet music as PDF and Midi file" {
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
  [ -f "$HOME/mmw/My_Test_MMW_project/My_Test_MMW_project.pdf" ]
  [ -f "$HOME/mmw/My_Test_MMW_project/My_Test_MMW_project.mid" ]
}

