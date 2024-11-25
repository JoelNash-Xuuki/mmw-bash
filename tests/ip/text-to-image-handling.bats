
@test "basic text" {
  ip.sh basicLabels $HOME/images/output.png
  [ -f $HOME/images/output.png ]
}


@test "Label using input file" {
  ip.sh basicOverMultiplLines tests/ip/input.txt $HOME/images/text-to-image.png
}
