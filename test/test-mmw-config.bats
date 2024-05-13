#!/usr/bin/env bats
@test "Can create config file" { 
  mmw-config createConfigFile 
  [ -f $HOME/.config/mmw.config ]
  rm $HOME/.config/mmw.config
}

@test "Can declare and set the project name" {
  mmw-config createConfigFile
  mmw-config addProjNameDeclaration
  projName=$(grep "^PROJ=$" "$HOME/.config/mmw.config")
  [ "$projName" = "PROJ=" ]
  rm $HOME/.config/mmw.config
}

@test "Can declare and set the project location" {
  mmw-config addProjLocation
  projLoc=$(grep "^PROJLOC=$" "$HOME/.config/mmw.config")
  [ "$projLoc" = "PROJLOC=" ]
  rm $HOME/.config/mmw.config
}

@test "Can declare and set the project file path" {
  mmw-config createConfigFile
  mmw-config addProjNameDeclaration
  mmw-config addProjFilePath 
  projFilePath=$(grep "^PROJPATH=\$HOME\$PROJLOC\$PROJ$" "$HOME/.config/mmw.config")
  [ "$projFilePath" = "PROJPATH=\$HOME\$PROJLOC\$PROJ" ]
}

