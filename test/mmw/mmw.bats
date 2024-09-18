#!/usr/bin/env bats
setup() {
  mmw-config create
  mmw-config addProjNameDeclaration
  mmw setProj My-Test-MMW-Proj
  mmw-config addArtistDeclaration
  mmw setArtist Test-Artist
  mmw-config addTempoDeclaration
  mmw setTempo 84
  mmw-config addStartTimeDeclaration
  mmw setStartTime 0
}

teardown() {
  rm -r "$PROJPATH"
  cp "$HOME/.config/mmw.config" .
  rm "$HOME/.config/mmw.config"
}

@test "Can set: project" {
  projName=$(grep "^PROJ=My-Test-MMW-Proj$" "$HOME/.config/mmw.config")
  [ "$projName" = "PROJ=My-Test-MMW-Proj" ]
}

@test "artist" {
    artistName=$(grep "^ARTIST=Test-Artist$" "$HOME/.config/mmw.config")
  [ "$artistName" = "ARTIST=Test-Artist" ]
}

@test "tempo" {
  tempo=$(grep "^TEMPO=84$" "$HOME/.config/mmw.config")
  [ "$tempo" = "TEMPO=84" ]
}

@test "start time" {
  startTime=$(grep "^START_TIME=0$" "$HOME/.config/mmw.config")
  [ "$startTime" = "START_TIME=0" ]
}

@test "dur/length" {                                                            
  # Extract the DUR value from the config file                                  
  dur=$(grep "^DUR=" "$HOME/.config/mmw.config")                                
                                                                                
  # Extract the LENGTH value from the config file                               
  length=$(grep "^LENGTH=" "$HOME/.config/mmw.config")                          
                                                                                
  # Expected DUR value                                                          
  expected_dur="DUR=\$(bc <<< \"scale=4;\$BAR*4\")"                              

  # Expected LENTH value                                                          
  expected_length="LENGTH=\$(bc <<< \"scale=4;\$BAR*16\")"
                                                                                
  # Check if the extracted DUR value matches the expected value                 
  [ "$dur" = "$expected_dur" ]                                                  
                                                                                
  # Check if the extracted LENGTH value is empty                                
  [ "$length" = "$expected_length" ]                                                     
}

#@test "creates a new project" {
#  mmw-config addProjNameDeclaration
#  mmw setProj My_Test_MMW_project
#  mmw-config addProjLocationDeclaration 
#  mmw setProjLoc 
#  mmw-config addProjFilePathDeclarationAndDefinition
#  mmw-config addArtistDeclaration
#  mmw setArtist test-artist
#  if [ -d "$HOME"/audio/test-artist/My_Test_MMW_project/ ]; then
#    rm -r "$HOME"/audio/test-artist/My_Test_MMW_project/
#  fi
#  echo "y" | mmw createProj
#  [ -d "$(mmw displayProj)" ] # PROJPATH
#  #[ -f $HOME/audio/test-artist/My_Test_MMW_project/stems/input_1.wav ]
#  #[ -d "$(mmw displayProj)"/sound-design ]
#  #[ -d "$(mmw displayProj)"/session ]
#}
#
#
                                                                               
