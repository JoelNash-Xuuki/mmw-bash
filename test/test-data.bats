source ./test/tmp/config
#!/usr/bin/env bats

@test "data file exits" {

  run ls $HOME/mmw/test/data/data.csv
  [ "$status" -eq 0 ]

}

