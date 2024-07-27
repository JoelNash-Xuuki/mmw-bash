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
  mmw-config addProjNameDeclaration
  declareProjName=$(grep "^PROJ=$" "$HOME/.config/mmw.config")
  [ "$declareProjName" = "PROJ=" ]
}

@test "Can declare project location dir" {
  mmw-config addProjLocationDeclaration
  projLoc=$(grep "^PROJLOC=$" "$HOME/.config/mmw.config")
  [ "$projLoc" = "PROJLOC=" ]
}

@test "Can declare and proj file path" {
  mmw-config addSessionDeclaration
  projFilePath=$(grep "^PROJPATH=\$HOME/\$PROJLOC/\$PROJ$" \
                      "$HOME/.config/mmw.config")
  [ "$projFilePath" = "PROJPATH=\$HOME/\$PROJLOC/\$PROJ" ]
}

@test "Can declare the artist" {
  mmw-config addArtistDeclaration
  artistName=$(grep "^ARTIST=$" "$HOME/.config/mmw.config")
  [ "$artistName" = "ARTIST=" ]
}

@test "Can declare the score" {
  mmw-config addScoreDeclarationAndDefinition
  score=$(grep "^SCORE=\$HOME/\$PROJLOC/\$PROJ.ly" "$HOME/.config/mmw.config")
  [ "$score" = "SCORE=\$HOME/\$PROJLOC/\$PROJ.ly" ]
}

@test "Can declare the session" {
  mmw-config addSessionDeclaration
  session=$(grep "^SESSION=session/session.eca$" "$HOME/.config/mmw.config")
  [ "$session" = "SESSION=session/session.eca" ]
}

