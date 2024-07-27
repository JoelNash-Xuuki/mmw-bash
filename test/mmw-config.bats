#!/usr/bin/env bats
setup() { 
  $HOME/mmw/bin/mmw-config create
}

teardown() {
  rm $HOME/.config/mmw.config
}

@test "Can create config file" { 
  [ -f $HOME/.config/mmw.config ]
}

@test "Can declare the project name" {
  mmw-config addProjNameDeclaration
  declareProjName=$(grep "^PROJ=$" "$HOME/.config/mmw.config")
  [ "$declareProjName" = "PROJ=" ]
}

@test "Can declare project location dir" {
  mmw-config addProjLocationDeclaration
  projLoc=$(grep "^PROJLOC=$" "$HOME/.config/mmw.config")
  [ "$projLoc" = "PROJLOC=" ]
}

