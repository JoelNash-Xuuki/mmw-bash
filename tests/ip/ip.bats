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

teardown() {
  source $HOME/.config/mmw.config
  rm "$PROJPATH"/images/stills/test.png
  rm $HOME/.config/mmw.config
}
 
@test "Generate solid colour canvas: enter filename, width then height " {
  ip.sh canvasSolidColorKhaki "$PROJPATH"/images/stills/test.png 720 720
  [ -f "$PROJPATH"/images/stills/test.png ]
}

@test "Generate solid colour canvas (xc short hand) " {
  ip.sh canvasSolidColorwheatxc "$PROJPATH"/images/stills/test.png 720 720
  [ -f "$PROJPATH"/images/stills/test.png ]
}

@test "specify xc canvas image, size and colour as single input image " {
  ip.sh canvasxcSingleInput "$PROJPATH"/images/stills/test.png 700 700
  [ -f "$PROJPATH"/images/stills/test.png ]
}

@test "Grab single pixel from existing image" {
  ip.sh grabPixelFromBuiltInRose "$PROJPATH"/images/stills/test.png
  [ -f "$PROJPATH"/images/stills/test.png ]
}

@test "Generate image built from sound file" {
   ffmpeg -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=48000 -t 5 "$PROJPATH"/audio/input.wav
   ffmpeg -i "$PROJPATH"/audio/input.wav -lavfi showspectrumpic=s=512x512:mode=combined "$PROJPATH"/images/stills/test.png 
   rm "$PROJPATH"/audio/input.wav
   [ -f "$PROJPATH"/images/stills/test.png ]
}

