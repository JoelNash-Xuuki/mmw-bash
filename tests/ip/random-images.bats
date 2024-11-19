#!/usr/bin/env bats
# https://usage.imagemagick.org/canvas/

@test "Can generate: noise" {
  ip.sh rawRandomNoise $HOME/images/random.png
  [ -f $HOME/images/random.png ]
}

@test "random flux" {
  ip.sh randomFlux $HOME/images/random.png
  [ -f $HOME/images/flux_30.png ]
}

@test "multi page image" {
  midicsv $HOME/Documents/My-Test-MMW-Proj.mid $HOME/Documents/My-Test-MMW-Proj.csv 
  csv_file="$HOME/Documents/My-Test-MMW-Proj.csv"  # Replace with your actual CSV file  
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
  ip.sh randomRipples $HOME/images/flux_0.png  $HOME/images/output.png 
  [ -f /data/images/output.png ]
}
