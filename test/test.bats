source ./test/tmp/config

@test "load a project" {
  output="$(mmw load)"
  [ "$output" = "loading project..." ]
  [ "$PROJ" = "test-project-1" ]
}

# Read the contents of insert.txt into a variable.

# Use the sed command to replace the placeholder in main.txt with the content of insert.txt.
#First file for you MMW tests
#@test "Can run a test that matches a string using bats and mmw" {
#  output="$(mmw getProjName test-mmw-proj)"
#  [ "$output" = "test-mmw-proj" ] 
#
#}
#
#@test "Use template file to create output/audio output files" { 
#  mmw createRecFile
#  filepath="/home/joel/mmw/tmp/test-rec-1.wav"
#  actual="$(cat $HOME/mmw/test/src/test-rec.csd | grep fout )" 
#  expected="        fout \"$filepath\", 14, ain1"
#  [ "$expected" = "$actual" ]
#}
#
#@test "Can rec to an audio file" { 
#  mmw rec $HOME/mmw/test/src/test-rec.csd
#  [ -f "$HOME/mmw/tmp/test-rec-1.wav" ]
#  rm $HOME/mmw/tmp/test-rec-1.wav
#}

#  sed "s/{projname}/$insert_context/g" ~/mmw/test/tmp/-settings ~/TTTG/tmp/chat.txt
