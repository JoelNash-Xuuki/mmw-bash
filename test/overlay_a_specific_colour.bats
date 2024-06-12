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

@test "Use Colorize (older technique) All to set all colours" {
  ip.sh generateTestImage
  # Alpha off because v6.7.9 colorize did not change the original images alpha
  # channel.
  convert $HOME/images/test.png -alpha off -fill Chocolate -colorize 100% \
          $HOME/images/color_levelc.gif
  [ -f "$HOME/images/color_levelc.gif" ]
  rm $HOME/images/test.png $HOME/images/color_levelc.gif
}

