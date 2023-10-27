#First file for you MMW tests
#@test "Use options template to set project option..." {
#  mmw createProject mmw/test/test-proj
#  if [ $HOME/mmw/test/mmw/test/test-proj/ ]; then
#    [ "$status" -eq 0 ]
#  fi
#}
source ./test/tmp/config

setup() {
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
   #  DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
   # PATH="$DIR/../src:$PATH"
  echo setup
  #proj-file-path="$HOME/mmw/test/$PROJ"
  #
  ## Check if the file exists
  #if [ -e "$proj-file-path" ]; then
  #    echo "The file exists: $proj-file_path"
  #else
  #    echo "Creating $proj-file_path"
  #    mkdir $HOME/mmw/test/$PROJ
  #fi

#teardown_file() {
#  if [ -d $HOME/mmw/test/test-proj  ]; then
#    rm $HOME/mmw/test/test-proj 
#  fi
#}

@test "Use template file to create output/audio output files" { 
  mmw createRecFile
  filepath="$HOME/mmw/tmp/test-rec-1.wav"
  actual="$(cat $HOME/mmw/test/src/test-rec.csd | grep fout )" 
  expected="        fout \"$filepath\", 14, ain1"
  [ "$expected" = "$actual" ]

@test "load a project" {
  output="$(mmw load)"
  [ "$output" = "loading project..." ]
  [ "$PROJ" = "test-project-1" ]
  [ "$PROJPATH" = "$HOME/mmw/test/$PROJ" ]
}

#@test "can create a file for 1 track" {
#
#}

#@test "Use options template to set project option..." {
#  mmw setOptions  
#  filepath="$HOME/mmw/tmp/option"
#  actual="$(cat $HOME/mmw/tmp/option | grep PROJ= )"
#  expected="/home/joel/$PROJ"
#  [ "$expected" = "$actual" ]
#}

@test "Use the options template to create options with user setproj name" {
  mmw setOptions #test-proj mmw/test/
  [ "$(cat $HOME/mmw/tmp/options | grep PROJ= )" = "PROJ=test-proj" ]

}

@test "Check the options file to confirm Project location exists" {
  if grep -q "PROJPATH=\$HOME/mmw/test"\
              "$HOME/mmw/tmp/options"; then 
    isProjPath="$(echo "Project location exists.")"
  else
    isProjPath="$(echo "Project location does not exist.")"
  fi 
  [ "$isProjPath" = "Project location exists." ]
}

#@test "Can use option template to create a location name for mmw projects" {
#  if [ ! -d $HOME/test-mmw-proj-location/ ]; then
#    mkdir $HOME/test-mmw-proj-location
#  fi
#
#  [ "$(cat /home/joel/mmw/tmp/options | grep 'PROJPATH=')" = "PROJPATH=/home/joel/test-mmw-proj-location" ]
#}
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




