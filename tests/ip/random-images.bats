#!/usr/bin/env bats
# https://usage.imagemagick.org/canvas/

setup() {
  mmw-config create
  mmw-config addProjNameDeclaration
  mmw setProj My-Test-MMW-Proj
  mmw-config addProjFilePathDeclarationAndDefinition
  mmw-config addArtistDeclaration
  mmw setArtist Test-Artist
  echo "y" | mmw createProj
  source $HOME/.config/mmw.config
}

@test "Can generate: noise" {
  ip.sh rawRandomNoise $PROJPATH/images/stills/random.png
  [ -f $PROJPATH/images/stills/random.png ]
}

@test "random flux" {
  ip.sh randomFlux $PROJPATH/images/stills/random.png
  [ -f $PROJPATH/images/stills/flux_30.png ]
}

@test "multi page image" {
  ip.sh midiToGif $HOME/Documents/My-Test-MMW-Proj.mid $HOME/Documents/My-Test-MMW-Proj.csv 7
  [ -f $PROJPATH/images/movies/multi-page-image.gif ]
}
 
# @test "electrical filaments" {
#   ip.sh electricalFilaments
#   [ -f $HOME/images/electrical-filaments.gif ]
# }
# 
# @test "random ripples" {
#   ip.sh randomRipples $HOME/images/flux_0.png  $HOME/images/output.png 
#   [ -f /data/images/output.png ]
# }
