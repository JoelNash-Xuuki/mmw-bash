@test "Create gradient: white top to black bottom" {
  convert -size 100x100 gradient: \
          $HOME/images/test_gradient.png
  [ -f "$HOME/images/test_gradient.png" ]
  hb mvFileToSourceDir $HOME/images/test_gradient.png 
}
@test "Create gradient: white left to black right" {
  convert -size 100x100 gradient: -rotate -90 \
          $HOME/images/test_gradient_L_to_R.png
  [ -f "$HOME/images/test_gradient_L_to_R.png" ]
  hb mvFileToSourceDir $HOME/images/test_gradient_L_to_R.png 
}

@test "Create gradient: white bottom to black top" {
  convert -size 100x100 gradient: -rotate -180 \
          $HOME/images/test_gradient_B_to_T.png
  [ -f "$HOME/images/test_gradient_B_to_T.png" ]
  hb mvFileToSourceDir $HOME/images/test_gradient_B_to_T.png 
}

