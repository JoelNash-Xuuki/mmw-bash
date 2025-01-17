#!/bin/bash

@test "Check MD5 hashsum of test.png on Google Drive" {

  result=$(rclone hashsum MD5 gdrive:test/test.png)
  expected="532bb8e9ef43484b1560728d95539fd1  test.png"
  [ "$result" == "$expected" ]
}

