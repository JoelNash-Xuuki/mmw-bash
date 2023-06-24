@test "can run our script" {
    ./src/project.sh
}

#@test "Test rec function with .csd file" {
#  mmw rec "test/src/test.csd"                                                                                            
#  [ "$status" -eq 0 ]
#}

@test "csound is installed" {
  command -v csound >/dev/null 2>&1 || {
    skip "csound is not installed"
  }
}

