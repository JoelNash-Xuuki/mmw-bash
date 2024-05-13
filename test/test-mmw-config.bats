#!/usr/bin/env bats
@test "Can create config file" { 
  mmw-config createConfigFile 
  [ -f $HOME/.config/mmw.config ]
  rm $HOME/.config/mmw.config
}

@test "Can declare the project name" {
  mmw-config createConfigFile
  mmw-config addProjNameDeclaration
  projName=$(grep "^PROJ=$" "$HOME/.config/mmw.config")
  [ "$projName" = "PROJ=" ]
  rm $HOME/.config/mmw.config
}

@test "Can declare project location" {
  mmw-config addProjLocation
  projLoc=$(grep "^PROJLOC=$" "$HOME/.config/mmw.config")
  [ "$projLoc" = "PROJLOC=" ]
  rm $HOME/.config/mmw.config
}

@test "Can declare and proj file path" {
  mmw-config createConfigFile
  mmw-config addProjNameDeclaration
  mmw-config addProjFilePath 
  projFilePath=$(grep "^PROJPATH=\$HOME\$PROJLOC\$PROJ$" \
                      "$HOME/.config/mmw.config")
  [ "$projFilePath" = "PROJPATH=\$HOME\$PROJLOC\$PROJ" ]
  rm $HOME/.config/mmw.config
}

@test "Can declare the artist" {
  mmw-config createConfigFile
  mmw-config addArtistDeclaration
  artistName=$(grep "^ARTIST=$" "$HOME/.config/mmw.config")
  [ "$artistName" = "ARTIST=" ]
  rm $HOME/.config/mmw.config
}

@test "Can declare the service" {
  mmw-config addServiceDeclaration
  service=$(grep "^SERVICE=$" "$HOME/.config/mmw.config")
  [ "$service" = "SERVICE=" ]
  rm $HOME/.config/mmw.config
}

