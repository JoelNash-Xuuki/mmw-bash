@test "As of IM v6.4.2-1 use +level-colors to set all colours" {
  ip.sh generateTestImage
  # The alpha/matte channel of an image is a special channel that controls
  # the transparency of each pixel in the image. It determines how opaque or
  # transparent each pixel should be, allowing for the creation of images with
  # varying levels of transparency. The -alpha type option in Imagemagick allows
  # you to manipulate this alpha channel to achieve different visual effects in
  # your images.
  convert $HOME/images/test.png -alpha Opaque +level-colors Sienna \
          $HOME/images/color_levelc.gif
  [ -f "$HOME/images/color_levelc.gif" ]
  rm $HOME/images/test.png $HOME/images/color_levelc.gif
}

@test "Use Colorize (older technique) to set all colours" {
  ip.sh generateTestImage
  # Alpha off because v6.7.9 colorize did not change the original images alpha
  # channel.
  convert $HOME/images/test.png -alpha off -fill Chocolate -colorize 100% \
          $HOME/images/color_levelc.gif
  [ -f "$HOME/images/color_levelc.gif" ]
  rm $HOME/images/test.png $HOME/images/color_levelc.gif
}

@test "As of IM v6.4.3-0: Use spare-color, sets a point to colour wanted" {
  ip.sh generateTestImage
  convert $HOME/images/test.png -alpha off \
          -sparse-color Voronoi '0,0 Peru' $HOME/images/color_sparse.gif
  [ -f "$HOME/images/color_sparse.gif" ]
  hb mvFileToSourceDir $HOME/images/color_sparse.gif 
  rm $HOME/images/test.png
}

@test "A more general overlay technique using draw, directly reset all colours" {
  ip.sh generateTestImage
  convert $HOME/images/test.png -fill Tan \
          -draw 'color 0,0 reset' $HOME/images/color_reset.gif
  [ -f "$HOME/images/color_reset.gif" ]
  hb mvFileToSourceDir $HOME/images/color_reset.gif 
  rm $HOME/images/test.png
}

@test "Alpha composition with Dst" {
  ip.sh generateTestImage
  convert $HOME/images/test.png -background Wheat \
          -compose Dst -flatten $HOME/images/color_flatten.gif
  [ -f "$HOME/images/color_flatten.gif" ]
  hb mvFileToSourceDir $HOME/images/color_flatten.gif 
  rm $HOME/images/test.png
}

