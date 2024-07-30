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
  rm -r $HOME/audio/test-artist/My_Test_MMW_project/
  echo "y" | mmw createProj
  [ -d "$(mmw displayProj)" ] # PROJPATH
  [ -f $HOME/audio/test-artist/My_Test_MMW_project/stems/input_1.wav ]            
  [ -d  $(mmw displayProj)/sound_design ]
  [ -d $(mmw displayProj)/session ]
}
