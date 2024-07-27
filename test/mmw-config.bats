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

