setup() {
  load 'test_helper/common-setup'
  _common_setup
}

teardown_file() {
  load 'test_helper/common-setup'
  _common_setup
}

@test "append file name" {
  for f in "test.mp4"; do touch "${f%.mp4}_tt.mp4"; done
  assert [ -e "test_tt.mp4" ]
}

@test "over png image" {
  :
}
