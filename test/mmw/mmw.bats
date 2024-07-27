#!/usr/bin/env bats
setup() {
  mmw-config create
  source $HOME/.config/mmw.config
  #$HOME/mmw/bin/mmw setProjLoc $HOME/mmw/test
  #$HOME/mmw/bin/mmw setArtist Vyvn
  #echo "y" | $HOME/mmw/bin/mmw createProj
}

teardown() {
#  rm -r "$PROJPATH"
  rm $HOME/.config/mmw.config
}

@test "Set the Project name" {
  mmw-config addProjNameDeclaration
  mmw setProj test-proj
  projName=$(grep "^PROJ=test-proj$" \
                  "$HOME/.config/mmw.config")
  [ "$projName" = "PROJ=test-proj" ]
}

