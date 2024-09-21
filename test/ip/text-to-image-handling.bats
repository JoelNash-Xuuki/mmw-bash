@test "basic text" {
  ip.sh basicLabels
  [ -f $HOME/Xuuki/src/sites/public/output.png ]
}
