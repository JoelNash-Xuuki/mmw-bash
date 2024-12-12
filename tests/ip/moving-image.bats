#!/usr/bin/env bats

setup_file() {
  mmw-config create
  mmw-config addProjNameDeclaration
  mmw setProj My-Test-MMW-Proj
  mmw-config addProjFilePathDeclarationAndDefinition
  mmw-config addArtistDeclaration
  mmw setArtist Test-Artist
  echo "y" | mmw createProj
  source $HOME/.config/mmw.config
  mmw writeLilyFile
  mmw createScorePDFAndMIDIFiles
  mmw buildInstrSoundDesignFiles
  mmw prodScoreAudio
  mmw makeTrack
  mmw createSessionFile
  $PROJPATH/session/session.eca

  AUDIO=$HOME/My-Test-MMW-Proj/audio/mix/My-Test-MMW-Proj.wav 
  OUTPUT=$HOME/My-Test-MMW-Proj/images/movies/output.mp4

  ip.sh createMP4 $AUDIO 6 $OUTPUT 360 360 

  ip.sh rawRandomNoise $PROJPATH/images/stills/random.png
  ip.sh randomFlux $PROJPATH/images/stills/random.png
  ip.sh midiToGif $HOME/Documents/My-Test-MMW-Proj.mid $HOME/Documents/My-Test-MMW-Proj.csv 7

  ip.sh overlayMediaBottomRight $OUTPUT $HOME/My-Test-MMW-Proj/images/stills/multi-page-image.gif $HOME/My-Test-MMW-Proj/images/movies/output-overlay.mp4

  # ip.sh scaleMP4 $OUTPUT $OUTPUT-Scaled.mp4
  # ip.sh rotateMP4 $OUTPUT $OUTPUT-Rotate.mp4
}

teardown_file() {
 source $HOME/.config/mmw.config
 # rm $OUTPUT
 #rm $OUTPUT-Scaled.mp4
}

@test "Can generate: mp4" {
  [ -f $OUTPUT ]
}

@test "Overlay media in different orders" {
  [ -f $HOME/My-Test-MMW-Proj/images/movies/output-overlay.mp4 ]
}
 
#@test "scale mp4 to 1920x1080" {
#  [ -f $OUTPUT-Scaled.mp4 ]
#}
# 
#@test "rotate mp4 90 degrees" {
#  [ -f $OUTPUT-Rotate.mp4 ]
#}

# @test "overlay" { 
#   ip.sh scaleMP4 $OUTPUT $HOME/output-temp.mp4
#   mv $HOME/output-temp.mp4 $OUTPUT
# 
#   ip.sh rotateMP4 $OUTPUT $HOME/output-temp.mp4
#   mv $HOME/output-temp.mp4 $OUTPUT 
# 
#   [ -f $HOME/images/multi-page-image.gif ]
#   ip.sh overlayImage $OUTPUT $HOME/images/electrical-filaments.gif 0 6 $HOME/output-temp.mp4 
# }
# 


