#!/usr/bin/env bats
# https://usage.imagemagick.org/canvas/

@test "Can generate: noise" {
  ip.sh rawRandomNoise
  [ -f $HOME/images/random.png ]
}

@test "random flux" {
  ip.sh randomFlux
  [ -f $HOME/images/flux_30.png ]
}

@test "multi page image" {
  csv_file="/home/jnash/Documents/My-Test-MMW-Proj.csv"  # Replace with your actual CSV file  
  track_number=7  # Replace with the desired track number                                     
  delays_str=$(ip.sh processMidiCSV "$csv_file" "$track_number")                                  
  IFS=' ' read -r -a delays <<< "$delays_str"                                                 
  ip.sh multiPageImage "${delays[@]}" 
  [ -f $HOME/images/multi-page-image.gif ]
}

@test "electrical filaments" {
  ip.sh electricalFilaments
  [ -f $HOME/images/electrical-filaments.gif ]
}

@test "random ripples" {
  ip.sh randomRipples
  [ -f $HOME/Xuuki/src/sites/public/output.png ]
}
