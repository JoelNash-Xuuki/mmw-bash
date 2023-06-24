@test "can run our script" {
    ./src/project.sh
}

@test "Test rec function with .csd file" {
  mmw rec "test/src/test.csd"                                                                                            [ "$status" -eq 0 ]
}
