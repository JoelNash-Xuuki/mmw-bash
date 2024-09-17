#!/usr/bin/env bats
setup() {
  mmw-config create
  mmw-config addProjNameDeclaration
  mmw-config addProjLocationDeclaration
  mmw-config addProjFilePathDeclarationAndDefinition
  mmw-config addTempoDeclaration
  mmw-config addScoreDeclarationAndDefinition
  mmw-config addArtistDeclaration
  mmw-config addSessionDeclaration
  mmw-config addStartTimeDeclaration
  mmw-config addDurDeclaration
}

teardown() {
  cp "$HOME"/.config/mmw.config mmw.config
  rm "$HOME"/.config/mmw.config
}

@test "Create config file" { 
  [ -f "$HOME"/.config/mmw.config ]
}

@test "Can declare: project name" {
  declareProjName=$(grep "^PROJ=$" "$HOME/.config/mmw.config")
  [ "$declareProjName" = "PROJ=" ]
}

@test "project location dir" {
  projLoc=$(grep "^PROJLOC=$" "$HOME/.config/mmw.config")
  [ "$projLoc" = "PROJLOC=" ]
}

@test "proj file path" {
   projFilePath=$(grep "^PROJPATH=\$HOME/\$PROJLOC/\$PROJ$" "$HOME/.config/mmw.config")
   [ "$projFilePath" = "PROJPATH=\$HOME/\$PROJLOC/\$PROJ" ]
}

@test "tempo" {
  tempo=$(grep "^TEMPO=$" "$HOME/.config/mmw.config")
  [ "$tempo" = "TEMPO=" ]
}

@test "score (and definition)" {
  projFilePath=$(grep "^SCORE=\$PROJPATH/\$PROJ.ly$" \
                      "$HOME/.config/mmw.config")
}

@test "artist" {
  artistName=$(grep "^ARTIST=$" "$HOME/.config/mmw.config")
  [ "$artistName" = "ARTIST=" ]
}

@test "session" {
  session=$(grep "^SESSION=session/session.eca$" "$HOME/.config/mmw.config")
  [ "$session" = "SESSION=session/session.eca" ]
}

@test "start time" {
  startTime=$(grep "^START_TIME=\$(bc <<< \"scale=2;\$BAR\*0\")$" "$HOME/.config/mmw.config")
  [ "$startTime" = "START_TIME=\$(bc <<< \"scale=2;\$BAR*0\")" ]
}

@test "duration" {
  dur=$(grep "^DUR=$" "$HOME/.config/mmw.config")
  [ "$dur" = "DUR=" ]
  length=$(grep "^LENGTH=$" "$HOME/.config/mmw.config")
  [ "$length" = "LENGTH=" ]
}

