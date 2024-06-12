@test "Create gradient: white top to black bottom" {
  convert -size 100x100 gradient: \
          $HOME/images/test_gradient.png
  [ -f "$HOME/images/test_gradient.png" ]
  hb mvFileToSourceDir $HOME/images/test_gradient.png 
}

