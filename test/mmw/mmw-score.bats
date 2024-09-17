setup() {
  mmw-config create
}

teardown() {
  source $HOME/.config/mmw.config
  rm -r $PROJPATH
  rm $HOME/.config/mmw.config
}

@test "creates a new project with score" {
  # shellcheck source=/dev/null
  mmw-config addProjNameDeclaration
  mmw setProj My_Test_MMW_project
  mmw-config addProjLocationDeclaration 
  mmw setProjLoc
  mmw-config addProjFilePathDeclarationAndDefinition
  mmw-config addArtistDeclaration
  mmw setArtist test-artist

  if [ -d "$HOME/audio/test-artist/My_Test_MMW_project/" ]; then 
    rm -r "$HOME/audio/test-artist/My_Test_MMW_project/"
  fi
  echo "y" | mmw createProj
  [ -d "$(mmw displayProj)" ] # PROJPATH
  [ -d "$(mmw displayProj)"/sound-design ]
  [ -d "$(mmw displayProj)"/session ]
  [ -f "$HOME/audio/test-artist/My_Test_MMW_project/stems/input_1.wav" ]
}

@test "createScoreDesign should create the project score file" {
  # shellcheck source=/dev/null
  mmw-config addProjNameDeclaration
  mmw setProj My_Test_MMW_project
  mmw-config addProjLocationDeclaration 
  mmw setProjLoc
  mmw-config addProjFilePathDeclarationAndDefinition
  mmw-config addArtistDeclaration
  mmw setArtist test-artist
  mmw-config addScoreDeclarationAndDefinition

  if [ -d "$HOME/audio/test-artist/My_Test_MMW_project/" ]; then 
    rm -r "$HOME/audio/test-artist/My_Test_MMW_project/"
  fi
  echo "y" | mmw createProj

  mmw writeLilyFile
  
  [ -f "$HOME/My_Test_MMW_project/My_Test_MMW_project.ly" ]


  #Validate data
  #[ "$(cat "$HOME/projects_/flock/src/$PROJ.ly)" = "$projOrc" ]
}

@test "create sheet music as PDF and Midi file" {
  mmw-config addProjNameDeclaration
  mmw setProj My_Test_MMW_project
  mmw-config addProjLocationDeclaration 
  mmw setProjLoc 
  mmw-config addProjFilePathDeclarationAndDefinition
  mmw-config addArtistDeclaration
  mmw setArtist test-artist
  mmw-config addScoreDeclarationAndDefinition

  if [ -d "$HOME/audio/test-artist/My_Test_MMW_project/" ]; then 
    rm -r "$HOME/audio/test-artist/My_Test_MMW_project/"
  fi
  echo "y" | mmw createProj
  [ "$HOME/My_Test_MMW_project/My_Test_MMW_project.ly" ]
  mmw-config addTempoDeclaration
  mmw setTempo 100
  mmw writeLilyFile
  mmw createScorePDFAndMIDIFiles
  [ -f "$HOME/Documents/My_Test_MMW_project.pdf" ]
  [ -f "$HOME/My_Test_MMW_project/My_Test_MMW_project.mid" ]
}

