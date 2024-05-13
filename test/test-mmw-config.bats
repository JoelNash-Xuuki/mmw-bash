#!/usr/bin/env bats

@test "Can create config file" { 
  mmw-config createConfigFile 
  [ -f $HOME/.config/mmw.config ]
}

@test "Can declare and set the project name" {
  mmw-config addProjNameDeclaration test-proj
  projName=$(grep "^PROJ=test-proj$" "$HOME/.config/mmw.config")
  [ "$projName" = "PROJ=test-proj" ]
}

