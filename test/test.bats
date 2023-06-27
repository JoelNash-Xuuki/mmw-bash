#First file for you MMW tests
@test "Can run a test that matches a string using bats and mmw" {
  output="$(mmw getProjName test-mmw-proj)"
  [ "$output" = "test-mmw-proj" ] 

}


@test "Check if test-rec-1.wav has been correctly printed into csound instr" {                                                
  mmw rec                                                                                                                
  [ -f "$HOME/mmw/test/src/test-rec.csd" ]
  [ "$(cat $HOME/mmw/test/src/test-rec.csd | grep 'fout ')" = "fout "test-rec-1.wav", 14, ain1 outs ain1*2.5, ain1*2.5" ]
}










#@test "Can name file to record to by printing it into a csound instr" {
#  mmw rec
#  [ "$(cat $HOME/mmw/test/src/test-rec.csd | grep 'fout ')" = "        fout "test-rec-1.wav", 14, ain1 outs ain1*2.5, ain1*2.5
#"]
#
#
#
#
#  
#  [ -f "$HOME/mmw/test/src/test-rec.csd" ]
#}
#
##[ "$status" -eq 0 ]   
#  #[ -f "$HOME/mmw/tmp/test-rec-1.wav" ]
