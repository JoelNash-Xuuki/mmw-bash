#First file for you MMW tests
@test "Can run a test that matches a string using bats and mmw" {
  output="$(mmw getProjName test-mmw-proj)"
  [ "$output" = "test-mmw-proj" ] 
}

@test "Need to find a way to test rec" {
  mmw rec
  [ "$(cat $HOME/mmw/test/src/test-rec.csd | grep 'fout ')" = "fout "test-rec-1.wav", 14, ain1 outs ain1*2.5, ain1*2.5"]

#i think the " " around test-rec-1.wav r fing with the match 




  #[ "$status" -eq 0 ]   
  #[ -f "$HOME/mmw/tmp/test-rec-1.wav" ]
  [ -f "$HOME/mmw/test/src/test-rec.csd" ]
}
