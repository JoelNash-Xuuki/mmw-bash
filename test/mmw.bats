#!/usr/bin/env bats
setup() {
  $HOME/mmw/bin/mmw-config create
  source $HOME/.config/mmw.config
  $HOME/mmw/bin/mmw setProj test-proj
  $HOME/mmw/bin/mmw setProjLoc $HOME/mmw/test
  $HOME/mmw/bin/mmw setArtist Vyvn
  echo "y" | $HOME/mmw/bin/mmw createProj
}

teardown() {
  source $HOME/.config/mmw.config
  rm -r "$PROJPATH"
  rm $HOME/.config/mmw.config
}

@test "Set the Project name" {
  projName=$(grep "^PROJ=test-proj$" \
                  "$HOME/.config/mmw.config")
  [ "$projName" = "PROJ=test-proj" ]
}

