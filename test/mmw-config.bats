#!/usr/bin/env bats
setup() { 
  mmw-config create
}

teardown() {
  rm $HOME/.config/mmw.config
}

@test "Can create config file" { 
  [ -f $HOME/.config/mmw.config ]
}

@test "Can declare the project name" {
  projName=$(grep "^PROJ=$" "$HOME/.config/mmw.config")
  [ "$projName" = "PROJ=" ]
}

@test "Can declare project location dir" {
  projLoc=$(grep "^PROJLOC=$" "$HOME/.config/mmw.config")
  [ "$projLoc" = "PROJLOC=" ]
}

@test "Can declare and proj file path" {
  projFilePath=$(grep "^PROJPATH=\$HOME/\$PROJLOC/\$PROJ$" \
                      "$HOME/.config/mmw.config")
  [ "$projFilePath" = "PROJPATH=\$HOME/\$PROJLOC/\$PROJ" ]
}

@test "Can declare the artist" {
  artistName=$(grep "^ARTIST=$" "$HOME/.config/mmw.config")
  [ "$artistName" = "ARTIST=" ]
}

@test "Can declare the score" {
  score=$(grep "^SCORE=$" "$HOME/.config/mmw.config")
  [ "$score" = "SCORE=" ]
}

@test "Can declare the session" {
  session=$(grep "^SESSION=session/$" \
                 "$HOME/.config/mmw.config")
  [ "$session" = "SESSION=session/" ]
}

#@test "Can declare the service" {
#  mmw-config addServiceDeclaration
#  service=$(grep "^SERVICE=$" "$HOME/.config/mmw.config")
#  [ "$service" = "SERVICE=" ]
#  rm $HOME/.config/mmw.config
#}
#
