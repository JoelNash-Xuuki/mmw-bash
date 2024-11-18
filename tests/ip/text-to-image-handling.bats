@test "basic text" {
  ip.sh basicLabels $HOME/images/output.png
  [ -f $HOME/images/output.png ]
}
