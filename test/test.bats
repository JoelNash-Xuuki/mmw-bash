#First file for you MMW tests
@test "Can run a test that matches a string using bats and mmw" {
  output="$(mmw getProjName test-mmw-proj)"
  [ "$output" = "test-mmw-proj" ] 
}

@test "Need to find a way to test rec" {
  #mmw rec
  sed "s/\[RECTOAUDIOFILE\]/test-rec-1.wav/g;" \
       /home/joel/mmw/test/src/test-rec-template.csd \  
       /home/joel/mmw/test/src/test-rec.csd

  #[ "$(cat $HOME/mmw/tmp/options | grep 'PROJ=')" = "PROJ=hi" ]
  #[ "$status" -eq 0 ]   
  [ -f "$HOME/mmw/tmp/test-rec-1.wav" ]
}
