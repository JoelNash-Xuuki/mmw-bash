@test "As of IM v6.4.2-1 use +level-colors to set all colours" {
  ip.sh generateTestImage
  convert $HOME/images/test.png -alpha Opaque +level-colors Sienna \
          $HOME/images/color_levelc.gif
  [ -f "$HOME/images/color_levelc.gif" ]
  rm $HOME/images/test.png
  rm $HOME/images/color_levelc.gif
}
